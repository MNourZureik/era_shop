import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:era_shop/utiles/api_url.dart';
import 'package:get/get.dart';
import '../../ApiModel/seller/UpdateStatusWiseOrderModel.dart';

class UpdateStatusWiseOrderService extends GetxService {
  Future<UpdateStatusWiseOrderModel?> updateStatusWiseOrder({
    required String userId,
    required String orderId,
    required String status,
    required String itemId,
    required String trackingId,
    required String trackingLink,
    required String deliveredServiceName,
  }) async {
    String uri= Constant.getDomainFromURL(Constant.BASE_URL);
    final params = {
      "userId": userId,
      "orderId": orderId,
      "status": status,
      "itemId": itemId,
    };
    final url = Uri.https(uri, Constant.updateOrderStatusBySeller, params);
    log("Update status by seller url :: $url");

    final headers = {
      'key': Constant.SECRET_KEY,
      "Content-Type": "application/json; charset=UTF-8",
    };

    final body = jsonEncode({
      "trackingId": trackingId,
      "trackingLink": trackingLink,
      "deliveredServiceName": deliveredServiceName,
    });
      final response = await http.patch(url, headers: headers, body: body);
    log('Update status by seller :: STATUS CODE :: ${response.statusCode} \n RESPONSE :: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return UpdateStatusWiseOrderModel.fromJson(jsonResponse);
    } else {
      throw Exception('Update status by seller Failed');
    }
  }
}
