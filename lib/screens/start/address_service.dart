import 'package:dio/dio.dart';
import 'package:flutter_tomato_record_clone_coding/constant/keys.dart';
import 'package:flutter_tomato_record_clone_coding/data/address_model.dart';
import 'package:flutter_tomato_record_clone_coding/utils/logger.dart';

class AddressService {
  void searchAddressByStr(String text) async {
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
    logger.d(addressModel);
  }
}
