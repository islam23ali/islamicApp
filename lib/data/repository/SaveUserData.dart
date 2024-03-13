import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/routing/route.dart';
import '../../core/utils/app_constants.dart';
import '../../presentation/splash/splash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../model/response/user_model.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final DioClient dioClient;

  SaveUserData({required this.sharedPreferences, required this.dioClient});

  /// save SharedData

  Future<void> saveUserData(UserModel userData) async {
    dioClient.updateHeader(userData.data?.token ?? "");
    String userSavedData = json.encode(userData);
    try {
      await sharedPreferences.setString(AppConstants.userData, userSavedData);
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> saveUserId(String userId) async {
  //   try {
  //     await sharedPreferences.setString(AppConstants.userId, userId);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(AppConstants.lang, lang);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveUserToken(String userTOKEN) async {
    dioClient.updateHeader(userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      throw e;
    }
  }
  // Future<void> saveBranchId(String branchId) async {
  //   try {
  //     await sharedPreferences.setString(AppConstants.branchId, branchId);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<void> saveTitle(String title) async {
    try {
      await sharedPreferences.setString(AppConstants.title, title);
    } catch (e) {
      throw e;
    }
  }

  // Future<void> saveUserName(String userName) async {
  //   try {
  //     await sharedPreferences.setString(AppConstants.userName, userName);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  //
  // Future<void> saveUserImage(String userImage) async {
  //   try {
  //     await sharedPreferences.setString(AppConstants.userImage, userImage);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<void> saveIsShowIntro(bool isShowIntro) async {
    try {
      await sharedPreferences.setBool(AppConstants.isShowIntro, isShowIntro);
    } catch (e) {
      throw e;
    }
  }

  ///get SharedData
  UserModel? getUserData()   {
    String?  userSavedData= sharedPreferences.getString(AppConstants.userData) ;
   if (userSavedData !=null) {
     Map<String, dynamic> userData = json.decode(userSavedData);
     UserModel userModel = UserModel.fromJson(userData);
     return userModel;
   }
  }

  // String getUserId() {
  //   return sharedPreferences.getString(AppConstants.userId) ?? "";
  // }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
  }
  String getLang() {
    return sharedPreferences.getString(AppConstants.lang) ?? "ar";
  }
  // String getBranchId() {
  //   return sharedPreferences.getString(AppConstants.branchId) ?? "";
  //
  // }
  String getBranchTitle() {
    return sharedPreferences.getString(AppConstants.title) ?? "";
  }

  // String getUserName() {
  //   return sharedPreferences.getString(AppConstants.userName) ?? "";
  // }
  //
  // String getUserImage() {
  //   return sharedPreferences.getString(AppConstants.userImage) ?? "";
  // }
  //
  // String getUserBanner() {
  //   return sharedPreferences.getString(AppConstants.userBanner) ?? "";
  // }
/// check SharedData
  bool isShowIntro() {
    return sharedPreferences.containsKey(AppConstants.isShowIntro);
  }
  bool isSaveBranchId() {
    return sharedPreferences.containsKey(AppConstants.branchId);
  }

  // bool isTitle() {
  //   return sharedPreferences.containsKey(AppConstants.title);
  // }
  ///clear SharedData
  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.userData);
    // await sharedPreferences.remove(AppConstants.userName);
    // await sharedPreferences.remove(AppConstants.userImage);
    // await sharedPreferences.remove(AppConstants.userId);
    await sharedPreferences.remove(AppConstants.userTOKEN);
    // await sharedPreferences.remove(AppConstants.branchId);
    await sharedPreferences.remove(AppConstants.title);
    // await sharedPreferences.remove(AppConstants.title);
    // await sharedPreferences.remove(AppConstants.userBanner);
    pushAndRemoveUntil(const Splash());

    return true;
  }
}
