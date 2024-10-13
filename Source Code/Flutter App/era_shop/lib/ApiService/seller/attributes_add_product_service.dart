import 'dart:convert';
import 'dart:developer';
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../ApiModel/seller/AttributeAddProductModel.dart';

class AttributesAddProductApi extends GetxService {
  Future<AttributeAddProductModel?> productAttributes() async {
    final url = Uri.parse(Constant.BASE_URL + Constant.attributes);

    final headers = {
      'key': Constant.SECRET_KEY,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    log('Attributes product add :: STATUS CODE :: ${response.statusCode} \n RESPONSE :: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return AttributeAddProductModel.fromJson(jsonResponse);
    } else {
      throw Exception('Attributes Status code is not 200');
    }
  }
}
