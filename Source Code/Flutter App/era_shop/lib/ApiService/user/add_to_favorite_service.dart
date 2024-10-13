import 'dart:convert';
import 'dart:developer';
import 'package:era_shop/utiles/globle_veriables.dart';
import 'package:http/http.dart' as http;
import 'package:era_shop/ApiModel/user/AddToFavoriteModel.dart';
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';

class AddToFavoriteApi extends GetxService {
  Future<AddToFavoriteModel?> addToFavorite({
    required String productId,
    required String categoryId,
  }) async {
    final url = Uri.parse(Constant.BASE_URL + Constant.favoriteUnFavorite);

    final body = jsonEncode({
      'userId': userId,
      'productId': productId,
      'categoryId': categoryId,
    });

    final headers = {
      'key': Constant.SECRET_KEY,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(url, headers: headers, body: body);

    log('Favorite Api Status code :: ${response.statusCode} \n Response Body ::  ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return AddToFavoriteModel.fromJson(jsonResponse);
    } else {
      throw Exception('Add to Favorite is failed');
    }
  }
}
