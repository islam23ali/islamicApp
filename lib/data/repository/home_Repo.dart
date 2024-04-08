import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/habits_body.dart';
import '../model/response/base/api_response.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  Future<ApiResponse> prayersRepo(String date) async {
    try {
      Response response = await dioClient.get('${AppURL.kPrayersURI}$date');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> percentageHomeRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kPercentageHomeURl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> analysisHomeRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kAnalysisHomeURl);
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
  Future<ApiResponse> makeAssumptionsRepo(String prayerId,slug,date) async {
    try {
      Response response = await dioClient.post(AppURL.kMakeAssumptionsURI,data: FormData.fromMap({
            'prayer_id':prayerId,
            'slug':slug,
            'date':date,
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> reportsRepo(String fromDate,toDate) async {
    try {
      Response response = await dioClient.get('${AppURL.kReportsURI}$fromDate&to_date=$toDate');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> titlePageRepo(String type) async {
    try {
      Response response = await dioClient.get('${AppURL.kTitlePagesURI}$type');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> goodDeedsRepo(String date) async {
    try {
      Response response = await dioClient.get('${AppURL.kGoodDeedsURI}$date');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> goodDeedsPostRepo(HabitsBody habitsBody,String date) async {
    try {
      Response response = await dioClient.post('${AppURL.kGoodDeedsPostURI}$date',data: habitsBody.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}