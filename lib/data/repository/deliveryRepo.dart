import 'package:dio/dio.dart';
import 'package:islamic_app/data/model/body/transport_orders_body.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class DeliveryRepo {
  final DioClient dioClient;

  DeliveryRepo({required this.dioClient});

  Future<ApiResponse> getOrder() async {
    try {
      Response response = await dioClient
          .get(AppURL.kOrderURI);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getSingleOrder(int id) async {
    try {
      Response response = await dioClient
          .get(AppURL.kOrderURI+"/${id}");

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}