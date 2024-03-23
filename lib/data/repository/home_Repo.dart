import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/habits_body.dart';
import '../model/response/base/api_response.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  Future<ApiResponse> prayersRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kPrayersURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> nextPrayRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kNextPrayerURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> assumptionsRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kAssumptionsURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> goodDeedsRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kGoodDeedsURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> goodDeedsPostRepo(HabitsBody habitsBody) async {
    try {
      Response response = await dioClient.post(AppURL.kGoodDeedsPostURI,data: habitsBody.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}