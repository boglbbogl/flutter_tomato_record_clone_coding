import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/constant/common_size.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start/address_service.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum:
          const EdgeInsets.only(left: common_padding, right: common_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
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
            icon: const Icon(CupertinoIcons.compass,
                color: Colors.white, size: 20),
            onPressed: () {
              final text = _addressController.text;
              if (text.isNotEmpty) {
                AddressService().searchAddressByStr(text);
              }
            },
            label: const Text(
              '현재 위치 찾기',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: common_padding),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: const Icon(Icons.image),
                      trailing:
                          ExtendedImage.asset('assets/imgs/tomato_logo.png'),
                      title: Text('address $index'),
                      subtitle: Text('subTitle $index'));
                }),
          ),
        ],
      ),
    );
  }
}
