import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/quality_report_body.dart';
import '../model/response/base/api_response.dart';

class QualitySpecialistRepo {
  final DioClient dioClient;

  QualitySpecialistRepo({required this.dioClient});

  Future<ApiResponse> reportsRepo() async {
    try {
      Response response = await dioClient.get(
          AppURL.kReportsURI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> questionRepo(String type) async {
    try {
      Response response = await dioClient.get(
          '${AppURL.kQuestionsURI}$type',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> qualityReportRepo(QualityReportBody qualityReportBody) async {
    try {
      Response response = await dioClient.post(
          AppURL.kQualityReportURI,data: FormData.fromMap({
        "charity_id": qualityReportBody.charityId,
        "note": qualityReportBody.note,
        "details_list": qualityReportBody.detailsList,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> cleanlinessReportRepo(QualityReportBody qualityReportBody) async {
    try {
      Response response = await dioClient.post(
          AppURL.kCleanlinessReportURI,data: FormData.fromMap({
        "charity_id": qualityReportBody.charityId,
        "note": qualityReportBody.note,
        "details_list": qualityReportBody.detailsList,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}