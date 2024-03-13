import 'package:dio/dio.dart';
import 'package:islamic_app/data/model/body/transport_orders_body.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class MyOrdersRepo {
  final DioClient dioClient;

  MyOrdersRepo({required this.dioClient});

  // Future<ApiResponse> myCurrentOrdersRepo() async {
  //   try {
  //     Response response = await dioClient
  //         .get(AppURL.kCurrentOrders);
  //
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> myPreviousOrdersRepo() async {
  //   try {
  //     Response response = await dioClient
  //         .get(AppURL.kPreviousOrders);
  //
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> oneOrderRepo(String orderId) async {
  //   try {
  //     Response response = await dioClient
  //         .get('${AppURL.kOneOrder}$orderId');
  //
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> updateOrderRepo(String orderId,OrdersBody ordersBody) async {
  //   try {
  //     Response response = await dioClient.post(
  //       "${AppURL.kUpdateOrder}$orderId",data: ordersBody.toJson(),);
  //
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> updateOfferRepo(String offerId,newPrice) async {
  //   try {
  //     Response response = await dioClient.post(
  //       "${AppURL.kUpdateOffer}$offerId",
  //       data: FormData.fromMap({
  //         "price": newPrice,
  //       }),);
  //
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> cancelOrderRepo(String orderId) async {
  //   try {
  //     Response response = await dioClient
  //         .get("${AppURL.kCancelOrder}$orderId");
  //
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
}