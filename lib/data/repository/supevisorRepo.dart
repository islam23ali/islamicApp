import 'package:dio/dio.dart';
import 'package:islamic_app/data/model/body/transport_orders_body.dart';
import 'package:islamic_app/data/repository/SaveUserData.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class SuperVisorRepo {
  final DioClient dioClient;

  SuperVisorRepo({required this.dioClient});

  Future<ApiResponse> getCharity(SaveUserData saveUserData) async {
    try {
      Response response = await dioClient.get(
          saveUserData.getUserData()!.data!.type == "general_supervisor"
              ? AppURL.kCharitygeneralURI
              : AppURL.kCharityURI);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getReports(SaveUserData saveUserData, String? date) async {
    try {
      Response response = await dioClient.get(
          saveUserData.getUserData()!.data!.type == "general_supervisor"
              ? AppURL.kgeneralReportURI
              : AppURL.kgfieldsupervisorReportURI,

          queryParameters: {
      if(saveUserData.getUserData()!.data!.type == "general_supervisor"&&date!.isNotEmpty)...{
        'date': date
      }}

      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getCharityReport(SaveUserData saveUserData,int charityId) async {
    try {
      Response response = await dioClient.get(
          saveUserData.getUserData()!.data!.type == "general_supervisor"
              ? AppURL.kgeneralReportURI+"/${charityId}"
              : AppURL.kgfieldsupervisorReportURI+"/${charityId}",



      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getDistribution(int reportId) async {
    try {
      Response response = await dioClient.get(
        AppURL.kdistibutionReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> confirmReport(int reportId) async {
    try {
      Response response = await dioClient.put(
        AppURL.kdistibutionReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getQualityReport(int reportId) async {
    try {
      Response response = await dioClient.get(
        AppURL.kqualityReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> confirmQualityReport(int reportId) async {
    try {
      Response response = await dioClient.put(
        AppURL.kqualityReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getAttandanceReport(int reportId) async {
    try {
      Response response = await dioClient.get(
        AppURL.kattandanceReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> confirmmAttandanceReport(int reportId) async {
    try {
      Response response = await dioClient.put(
        AppURL.kattandanceReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
