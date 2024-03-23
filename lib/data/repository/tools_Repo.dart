import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/habits_body.dart';
import '../model/response/base/api_response.dart';

class ToolsRepo {
  final DioClient dioClient;

  ToolsRepo({required this.dioClient});


  Future<ApiResponse> hadithRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kHadithURl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> remembranceRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kRemembranceURl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> remembranceDetailsRepo(String remembranceId) async {
    try {
      Response response = await dioClient.get('${AppURL.kRemembranceDetailsURl}$remembranceId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> supplicationRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kSupplicationURl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> supplicationDetailsRepo(String supplicationId) async {
    try {
      Response response = await dioClient.get('${AppURL.kSupplicationDetailsURl}$supplicationId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> imsakiaRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kImsakiaURl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}