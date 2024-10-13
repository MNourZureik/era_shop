import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:era_shop/ApiModel/login/CheckUserLoginModel.dart';
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';

class CheckLoginApi extends GetxService {
  Future<CheckUserLoginModel> checkUser({
    required String email,
    required String password,
    required int loginType,
  }) async {
    final url = Uri.parse(Constant.BASE_URL + Constant.checkUser);

    final headers = {
      'key': Constant.SECRET_KEY,
      "Content-Type": "application/json; charset=UTF-8",
    };
    log("loginType :: $loginType");
    final body = jsonEncode({
      "email": email,
      "password": password,
      "loginType": loginType,
    });

    final response = await http.post(url, body: body, headers: headers);

    log("Check Login Api Status code ::  ${response.statusCode}");

    log(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return CheckUserLoginModel.fromJson(jsonResponse);
    } else {
      throw Exception('User check api Failed');
    }
  }
}
