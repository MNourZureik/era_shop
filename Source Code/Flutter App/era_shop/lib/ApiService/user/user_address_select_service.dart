import 'dart:convert';
import 'dart:developer';

import 'package:era_shop/ApiModel/user/UserAddressSelectModel.dart';
import 'package:era_shop/utiles/api_url.dart';
import 'package:era_shop/utiles/globle_veriables.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserAddressSelectApi extends GetxService {
  Future<UserAddressSelectModel> userSelectAddress({required String addressId}) async {
    String uri= Constant.getDomainFromURL(Constant.BASE_URL);
    var params = {"addressId": addressId, "userId": userId};

    final url = Uri.https(uri, Constant.userSelectAddress, params);

    final headers = {
      'key': Constant.SECRET_KEY,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.patch(url, headers: headers);

    log('User Select Address URL :: $url \n API STATUS CODE :: ${response.statusCode} \n RESPONSE :: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return UserAddressSelectModel.fromJson(jsonResponse);
    } else {
      throw Exception('User Select Address is failed');
    }
  }
}
