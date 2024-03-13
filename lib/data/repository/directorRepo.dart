import 'package:dio/dio.dart';
import 'package:islamic_app/data/model/body/transport_orders_body.dart';
import 'package:islamic_app/data/repository/SaveUserData.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class DirectorRepo {
  final DioClient dioClient;

  DirectorRepo({required this.dioClient});



  Future<ApiResponse> getReports() async {
    try {
      Response response = await dioClient.get(
          AppURL.kdirectorReportURI



      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getDistributionReport(int reportId) async {
    try {
      Response response = await dioClient.get(
          AppURL.kdistibutionReportURI+"/${reportId}"




      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getDistribution() async {
    try {
      Response response = await dioClient.get(
          AppURL.kdistrubutionURI



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
  Future<ApiResponse> addopnion(String note) async {
    try {
      Response response = await dioClient.post(
        AppURL.kopinionURI,

          queryParameters: {
          'note':note
          }




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
