import 'package:dio/dio.dart';
import 'package:flutter_tomato_record_clone_coding/constant/keys.dart';
import 'package:flutter_tomato_record_clone_coding/data/address_model.dart';
import 'package:flutter_tomato_record_clone_coding/data/address_model2.dart';
import 'package:flutter_tomato_record_clone_coding/utils/logger.dart';

class AddressService {
  Future<AddressModel> searchAddressByStr(String text) async {
    final formData = {
      'key': Vworld_key,
      'request': 'search',
      'type': 'ADDRESS',
      'category': 'ROAD',
      'query': text,
      'size': 30,
    };

    final response = await Dio()
        .get('http://api.vworld.kr/req/search', queryParameters: formData)
        .catchError((e) {
      logger.e(e.message);
    });
    AddressModel addressModel =
        AddressModel.fromJson(response.data["response"]);
    return addressModel;
  }

  Future<List<AddressModel2>> finaAddressByCoordinate(
      {required double log, required double lat}) async {
    final List<Map<String, dynamic>> formDatas = <Map<String, dynamic>>[];

    formDatas.add({
      'key': Vworld_key,
      'service': 'address',
      'request': 'getAddress',
      'type': 'PARCEL',
      'point': '$log,$lat',
    });
    formDatas.add({
      'key': Vworld_key,
      'service': 'address',
      'request': 'getAddress',
      'type': 'PARCEL',
      'point': '${log - 0.01},$lat',
    });
    formDatas.add({
      'key': Vworld_key,
      'service': 'address',
      'request': 'getAddress',
      'type': 'PARCEL',
      'point': '${log + 0.01},$lat',
    });
    formDatas.add({
      'key': Vworld_key,
      'service': 'address',
      'request': 'getAddress',
      'type': 'PARCEL',
      'point': '$log,${lat - 0.01}',
    });
    formDatas.add({
      'key': Vworld_key,
      'service': 'address',
      'request': 'getAddress',
      'type': 'PARCEL',
      'point': '$log,${lat + 0.01}',
    });

    List<AddressModel2> addresses = [];

    for (Map<String, dynamic> formData in formDatas) {
      final response = await Dio()
          .get('http://api.vworld.kr/req/address', queryParameters: formData)
          .catchError((e) {
        logger.e(e.message);
      });

      AddressModel2 addressModel2 =
          AddressModel2.fromJson(response.data["response"]);

      if (response.data["response"]['status'] == 'OK') {
        addresses.add(addressModel2);
      }
    }
    return addresses;
  }
}
