import 'package:dio/dio.dart';
import 'package:islamic_app/data/model/body/transport_orders_body.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/delivery_order_body.dart';
import '../model/body/package_meals_body.dart';
import '../model/body/register_Incoming_Items_body.dart';
import '../model/response/base/api_response.dart';

class StoreKeeperRepo {
  final DioClient dioClient;

  StoreKeeperRepo({required this.dioClient});

  Future<ApiResponse> stockItemsRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kStockItemsURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> charitiesRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kCharitiesOrderURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> productsRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kProductsURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> suppliersRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kSuppliersURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> captainRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kCaptainURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> locationRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kLocationsURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registerIncomingItemsRepo(RegisterIncomingItemsBody registerIncomingItemsBody) async {
    try {
      Response response = await dioClient.post(
          AppURL.kRegisterIncomingItemsURI,data: registerIncomingItemsBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> packageMealsRepo(PackageMealsBody packageMealsBody) async {
    try {
      Response response = await dioClient.post(
          AppURL.kPackageMealsURI,data: FormData.fromMap({
        "charity_id": packageMealsBody.charityId,
        "amount": packageMealsBody.amount,
        "date": packageMealsBody.date,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deliveryOrderRepo(DeliveryOrderBody deliveryOrderBody) async {
    try {
      Response response = await dioClient.post(
          AppURL.kDeliveryOrderURI,data: FormData.fromMap({
        "charity_id": deliveryOrderBody.charityId,
        "driver_id": deliveryOrderBody.driverId,
        "location_id": deliveryOrderBody.locationId,
        "meal_count": deliveryOrderBody.mealCount,
        "water_count": deliveryOrderBody.waterCount,
        "date": deliveryOrderBody.date,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> receivingOrderRepo(DeliveryOrderBody deliveryOrderBody) async {
    try {
      Response response = await dioClient.post(
          AppURL.kReceivingOrderURI,data: FormData.fromMap({
        "charity_id": deliveryOrderBody.charityId,
        "driver_id": deliveryOrderBody.driverId,
        "location_id": deliveryOrderBody.locationId,
        "meal_count": deliveryOrderBody.mealCount,
        "water_count": deliveryOrderBody.waterCount,
        "date": deliveryOrderBody.date,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}