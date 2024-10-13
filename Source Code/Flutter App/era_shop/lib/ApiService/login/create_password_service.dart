import 'dart:convert';
import 'dart:developer';
import 'package:era_shop/ApiModel/login/CrateNewPasswordModel.dart';
import 'package:http/http.dart' as http;
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';

class CreatePasswordApi extends GetxService {
  Future<CrateNewPasswordModel> createPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final url = Uri.parse(Constant.BASE_URL + Constant.setPassword);

    final headers = {
      'key': Constant.SECRET_KEY,
      "Content-Type": "application/json; charset=UTF-8",
    };

    final body = jsonEncode({
      "email": email,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
    });
    final response = await http.post(url, headers: headers, body: body);

    log("Create Password :: ${response.statusCode}");

    log(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return CrateNewPasswordModel.fromJson(jsonResponse);
    } else {
      throw Exception('Otp api Failed');
    }
  }
}
