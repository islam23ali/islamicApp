import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic_app/data/model/body/login_body.dart';
import 'package:islamic_app/data/model/response/base/emptyDataModel.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../data/repository/auth_repo.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/response/user_model.dart';
import '../../core/api_checker.dart';
import '../../core/routing/route.dart';
import '../../data/model/response/assumption_model.dart';
import '../../data/model/response/next_prayer_model.dart';
import '../../data/model/response/prayers_model.dart';
import '../../data/repository/home_Repo.dart';
import '../splash/splash.dart';

class RegisterScreenViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;

  RegisterScreenViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;



  bool checkBoxValue=false;
  // int? isClicked;
  // String? isClickedKey;

  PrayersModel? _prayersModel;
  NextPrayerModel? _nextPrayerModel;
  AssumptionsModel? _assumptionsModel;
  EmptyDataModel? _emptyDataModel;

  final TextEditingController praysDateController =TextEditingController();

  ///getters
  bool get isLoading => _isLoading;

  ///setters

  PrayersModel? get prayersModel => _prayersModel;
  AssumptionsModel? get assumptionsModel => _assumptionsModel;
  NextPrayerModel? get nextPrayerModel => _nextPrayerModel;
  EmptyDataModel? get emptyDataModel => _emptyDataModel;

  ///calling APIs Functions

  Future<ApiResponse> nextPrayAPI (BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.nextPrayRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _nextPrayerModel = NextPrayerModel.fromJson(responseModel.response?.data);

      if (_nextPrayerModel?.status == 200) {
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));

      } else if(_nextPrayerModel?.status==401) {
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));}
      else{
        ToastUtils.showToast(_nextPrayerModel?.message.toString() ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> prayersAPI (BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.prayersRepo(praysDateController.text);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _prayersModel = PrayersModel.fromJson(responseModel.response?.data);

      if (_prayersModel?.status == 200) {
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));

      }else if(_prayersModel?.status==401) {
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));}
      else {
        ToastUtils.showToast(_prayersModel?.message.toString() ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getAllAssumptions (BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.assumptionsRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _assumptionsModel = AssumptionsModel.fromJson(responseModel.response?.data);

      if (_assumptionsModel?.status == 200) {
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));

      } else if(_assumptionsModel?.status==401) {
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));}
      else {
        ToastUtils.showToast(_assumptionsModel?.message.toString() ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> makeAssumptions (BuildContext context,prayerId,slug) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await homeRepo.makeAssumptionsRepo(prayerId,slug,praysDateController.text);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);

      if (_emptyDataModel?.status == 200) {
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));
        ToastUtils.showToast(_emptyDataModel?.message.toString() ?? "");
      } else if(_emptyDataModel?.status==401) {
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));}
      else {
        ToastUtils.showToast(_emptyDataModel?.message.toString() ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  refreshData(){
    notifyListeners();
  }
}
