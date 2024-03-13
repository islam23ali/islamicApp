import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  // Future<ApiResponse> favoriteSportsRepo() async {
  //   try {
  //     Response response = await dioClient.get(AppURL.kFavoriteSportsURI);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> mainSliderRepo() async {
  //   try {
  //     Response response = await dioClient.get(AppURL.kMainSliderURI);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> newsRepo(String pagination,perPage) async {
  //   try {
  //     Response response = await dioClient.get('${AppURL.kNewsURI}$pagination&per_page=$perPage');
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> allSportsRepo() async {
  //   try {
  //     Response response = await dioClient.get(AppURL.kAllSportsURI);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> mostPopularSportsRepo() async {
  //   try {
  //     Response response = await dioClient.get(AppURL.kMostPopularSportsURI);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> reservationRepo(String all) async {
  //   try {
  //     Response response = await dioClient.get('${AppURL.kReservationURI}?all=$all');
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> playgroundsRepo(String sportId,pagination,perPage) async {
  //   try {
  //     Response response = await dioClient.get('${AppURL.kPlaygroundsURI}?sport_id=$sportId&pagination=$pagination&per_page=$perPage');
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> notificationCountRepo() async {
  //   try {
  //     Response response = await dioClient.get(AppURL.kNotificationCount);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  // Future<ApiResponse> notificationListRepo() async {
  //   try {
  //     Response response = await dioClient.get(AppURL.kGetNotificationsURI);
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
}