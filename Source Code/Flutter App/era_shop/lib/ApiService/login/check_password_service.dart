import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';

import '../../ApiModel/login/check_password_model.dart';

class CheckPasswordService extends GetxService {
  Future<CheckPasswordModel?> checkPassword({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Constant.BASE_URL + Constant.checkPassword);

    log("email ::: $email");
    log("password ::: $password");

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final headers = {
      'key': Constant.SECRET_KEY,
      "Content-Type": "application/json; charset=UTF-8",
    };

    final response = await http.post(url, headers: headers, body: body);

    log("Check Password Status code :: ${response.statusCode} Response Body :: ${response.body}");

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return CheckPasswordModel.fromJson(jsonResponse);
    } else {
      throw Exception('Check Password');
    }
  }
}
