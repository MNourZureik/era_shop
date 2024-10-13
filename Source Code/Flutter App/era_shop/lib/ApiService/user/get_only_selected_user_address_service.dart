import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../ApiModel/user/UserAddressSelectModel.dart';
import '../../utiles/api_url.dart';
import '../../utiles/globle_veriables.dart';

class GetOnlySelectedUserAddressApi extends GetxService{
  Future<UserAddressSelectModel?> getOnlySelectedAddress() async {
    String uri= Constant.getDomainFromURL(Constant.BASE_URL);
    final params = {
      "userId" : userId
    };
    final url = Uri.https(uri, Constant.getOnlySelectedAddress,params);


    final headers = {
      'key': Constant.SECRET_KEY,
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(url, headers: headers);

    log('Only Selected User Address Api URL :: $url \n STATUS CODE :: ${response.statusCode} \n RESPONSE :: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return UserAddressSelectModel.fromJson(jsonResponse);
    } else {
      throw Exception('Status code is not 200');
    }
  }
}