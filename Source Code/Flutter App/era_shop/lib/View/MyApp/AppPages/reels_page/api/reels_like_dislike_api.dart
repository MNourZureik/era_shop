import 'dart:developer';

import 'package:era_shop/utiles/api_url.dart';
import 'package:http/http.dart' as http;


class ReelsLikeDislikeApi {
  static Future<void> callApi({required String loginUserId, required String videoId}) async {
    log("Reels Like-Dislike Api Calling...");

    final uri = Uri.parse("${Constant.BASE_URL
        +Constant.shortsLikeAndDislike}?userId=$loginUserId&reelId=$videoId");

    final headers = {"key": Constant.SECRET_KEY};
    log("Log:::::uri::::>>>$uri");

    try {
      final response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        log("Reels Like-Dislike Api Response => ${response.body}");
      } else {
        log("Reels Like-Dislike Api StateCode Error");
      }
    } catch (error) {
      log("Reels Like-Dislike Api Error => $error");
    }
  }
}
