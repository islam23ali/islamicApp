import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/login_body.dart';
import '../model/body/register_body.dart';
import '../model/response/base/api_response.dart';
import 'SaveUserData.dart';

class AuthRepo {
  final DioClient dioClient;
  final SaveUserData saveUserData;
  AuthRepo({required this.dioClient, required this.saveUserData});



  Future<ApiResponse> loginRepo(LoginBody loginBody) async {
    try {
      Response response = await dioClient.post(
        AppURL.kLoginURI,data: loginBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> loginSocialRepo(String email) async {
    try {
      Response response = await dioClient.post(
        AppURL.kLoginSocialURI,data: FormData.fromMap({
        'email':email,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registerSocialRepo(String email) async {
    try {
      Response response = await dioClient.post(
        AppURL.kRegisterSocialURI,data: FormData.fromMap({
        'email':email,
      })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registerRepo(RegisterBody registerBody) async {
    try {
      Response response = await dioClient.post(
        AppURL.kRegisterURI,data: registerBody.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

// Future<ApiResponse> registerRepo(RegisterBody? registerBody) async {
//   try {
//     // TargetPlatform deviceType = getDeviceType();/// for software_type
//     // print("deviceType____${deviceType.name}");
//     Response response = await dioClient.post(
//       AppURL.kRegisterURI,
//       data: FormData.fromMap({
//         "country_id": registerBody?.countryId??'',
//         "government_id": registerBody?.governmentId??'',
//         "city_id": registerBody?.cityId??'',
//         "area_id": registerBody?.areaId??'',
//         "phone": registerBody?.phone??'',
//         "name": registerBody?.name??'',
//         "gender": registerBody?.gender??'',
//         "email": registerBody?.email,
//         "birthdate": registerBody?.birthdate,
//         "type": registerBody?.type,
//         "password": registerBody?.password,
//         "address": registerBody?.address,
//         "longitude": registerBody?.longitude,
//         "latitude": registerBody?.latitude,
//         "image":  registerBody?.image == null ? null : await MultipartFile.fromFile(registerBody!.image!.path),
//         "commercial_registration":  registerBody?.commercialRegistration == null ? null : await MultipartFile.fromFile(registerBody!.image!.path),
//       }),
//     );
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }
// Future<ApiResponse> updateProfile(UpdateProfileBody? updateProfileBody) async {
//   try {
//     Response response = await dioClient.post(
//       AppURL.kUpdateProfileURI,
//       data: FormData.fromMap({
//         "first_name": updateProfileBody?.firstName??'',
//         "last_name": updateProfileBody?.lastName??'',
//         "image":  updateProfileBody?.image == null ? null : await MultipartFile.fromFile(updateProfileBody!.image!.path),
//       }),
//     );
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }
// Future<ApiResponse> getProfileData() async {
//   try {
//     Response response = await dioClient.get(
//       AppURL.kGetProfileDataURI,
//     );
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }
// Future<ApiResponse> logout() async {
//   try {
//     Response response = await dioClient.post(
//       AppURL.kLogoutURI,
//       data: FormData.fromMap({
//         "token": saveUserData.getUserToken()??'',
//       }),
//     );
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }
// Future<ApiResponse> deleteAccount() async {
//   try {
//     Response response = await dioClient.get(
//       AppURL.kDeleteAccountURI
//     );
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }

// Future<ApiResponse> updateFCMToken({required String fcmToken}) async {
//   try {
//     TargetPlatform deviceType = getDeviceType();/// for software_type
//     Response response = await dioClient.post(AppURL.kUpdateFCMTokenURI,
//         queryParameters: {
//           'token':fcmToken,
//           'lang':saveUserData.getLang(),
//           'type':deviceType.name});
//     return ApiResponse.withSuccess(response);
//   } catch (e) {
//     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   }
// }
TargetPlatform getDeviceType() {/// for software_type
  return defaultTargetPlatform;
}
}
