import 'dart:convert';
import 'dart:developer';
import 'package:era_shop/ApiModel/user/GalleryCategoryModel.dart';
import 'package:http/http.dart' as http;
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';

class GalleryCategoryApi extends GetxService {
  Future<GalleryCategoryModel?> showCategory({
    required String categoryId,
    required String userId,
    required String start,
    required String limit,
  }) async {
    log("categoryId :: $categoryId");
    log("userId :: $userId");
    log("Start :: $start");
    log("Limit :: $limit");
    String uri= Constant.getDomainFromURL(Constant.BASE_URL);
    final params = {
      "categoryId": categoryId,
      "userId": userId,
      "start": start,
      "limit": limit,
    };
    final url = Uri.https(uri, Constant.galleryCategory, params);

    final headers = {
      'key': Constant.SECRET_KEY,
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(url, headers: headers);

    log('Gallery api :: ${response.statusCode} \n RESPONSE :: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return GalleryCategoryModel.fromJson(jsonResponse);
    } else {
      throw Exception('Status code is not 200');
    }
  }
}
