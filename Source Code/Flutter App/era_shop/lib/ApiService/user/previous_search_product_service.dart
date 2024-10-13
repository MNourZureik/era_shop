import 'dart:convert';
import 'dart:developer';

import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../ApiModel/user/PreviousSearchProductModel.dart';

class PreviousSearchProductApi extends GetxService {
  Future<PreviousSearchProductModel?> previousSearchData() async {
    final url = Uri.parse(Constant.BASE_URL + Constant.previousSearchProducts);

    final headers = {
      'key': Constant.SECRET_KEY,
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(url, headers: headers);

    log('Previous Search Api STATUS CODE :: ${response.statusCode} Url :: $url  \n RESPONSE :: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return PreviousSearchProductModel.fromJson(jsonResponse);
    } else {
      throw Exception('Status code is not 200');
    }
  }
}
