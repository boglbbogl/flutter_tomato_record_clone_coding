import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/constant/common_size.dart';
import 'package:flutter_tomato_record_clone_coding/data/address_model.dart';
import 'package:flutter_tomato_record_clone_coding/data/address_model2.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/address_service.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _addressController = TextEditingController();
  AddressModel? _addressModel;
  final List<AddressModel2> _addressModel2List = [];
  bool _isGettingLocation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum:
          const EdgeInsets.only(left: common_padding, right: common_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            onFieldSubmitted: (text) async {
              _addressModel2List.clear();
              _addressModel = await AddressService().searchAddressByStr(text);
              setState(() {});
            },
            controller: _addressController,
            decoration: const InputDecoration(
              hintText: '도로명으로 검색',
              hintStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 24, minHeight: 24),
            ),
          ),
          TextButton.icon(
            icon: _isGettingLocation
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(color: Colors.white))
                : const Icon(CupertinoIcons.compass,
                    color: Colors.white, size: 20),
            onPressed: () async {
              _addressModel2List.clear();

              _addressModel = null;
              setState(() {
                _isGettingLocation = true;
              });
              Location location = Location();

              bool _serviceEnabled;
              PermissionStatus _permissionGranted;
              LocationData _locationData;

              _serviceEnabled = await location.serviceEnabled();
              if (!_serviceEnabled) {
                _serviceEnabled = await location.requestService();
                if (!_serviceEnabled) {
                  return;
                }
              }
              _permissionGranted = await location.hasPermission();
              if (_permissionGranted == PermissionStatus.denied) {
                _permissionGranted = await location.requestPermission();
                if (_permissionGranted != PermissionStatus.granted) {
                  return;
                }
              }
              _locationData = await location.getLocation();
              List<AddressModel2> addresses = await AddressService()
                  .finaAddressByCoordinate(
                      log: _locationData.longitude!,
                      lat: _locationData.latitude!);
              _addressModel2List.addAll(addresses);
              setState(() {
                _isGettingLocation = false;
              });
            },
            label: Text(
              _isGettingLocation ? '위치 찾는 중...' : '현재 위치 찾기',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (_addressModel != null)
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: common_padding),
                  itemCount: (_addressModel == null ||
                          _addressModel!.result == null ||
                          _addressModel!.result!.items == null)
                      ? 0
                      : _addressModel!.result!.items!.length,
                  itemBuilder: (context, index) {
                    if (_addressModel == null ||
                        _addressModel!.result == null ||
                        _addressModel!.result!.items == null ||
                        _addressModel!.result!.items![index].address == null) {
                      return Container();
                    }
                    return ListTile(
                        onTap: () {
                          _saveAddressAndGoToNextPage(_addressModel!
                                  .result!.items![index].address!.road ??
                              "");
                        },
                        leading: const Icon(Icons.location_on_rounded),
                        trailing: ExtendedImage.asset(
                          'assets/imgs/tomato_logo.png',
                        ),
                        title: Text(_addressModel!
                                .result!.items![index].address!.road ??
                            ""),
                        subtitle: Text(_addressModel!
                                .result!.items![index].address!.parcel ??
                            ""));
                  }),
            ),
          if (_addressModel2List.isNotEmpty)
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: common_padding),
                  itemCount: _addressModel2List.length,
                  itemBuilder: (context, index) {
                    if (_addressModel2List[index].input == null) {
                      return Container();
                    }
                    return ListTile(
                      onTap: () {
                        _saveAddressAndGoToNextPage(
                            _addressModel2List[index].input!.address ?? "주소없음");
                      },
                      leading: const Icon(Icons.location_on_rounded),
                      trailing: ExtendedImage.asset(
                        'assets/imgs/tomato_logo.png',
                      ),
                      title: Text(
                        _addressModel2List[index].input!.address ?? "주소없음",
                      ),
                    );
                  }),
            ),
        ],
      ),
    );
  }

  _saveAddressAndGoToNextPage(String address) async {
    await _saveAddressOnSharedPreferencd(address);

    context.read<PageController>().animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  _saveAddressOnSharedPreferencd(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
  }
}
