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
import '../../data/model/body/habits_body.dart';
import '../../data/model/response/assumption_model.dart';
import '../../data/model/response/habits_model.dart';
import '../../data/model/response/prayers_model.dart';
import '../../data/repository/home_Repo.dart';

class HabitsScreenViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;

  HabitsScreenViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;



  // int? isClicked;

  HabitsModel? _habitsModel;
  EmptyDataModel? _emptyDataModel;

  // final TextEditingController userNameController = TextEditingController();

  ///getters
  bool get isLoading => _isLoading;

  ///setters

  HabitsModel? get habitsModel => _habitsModel;
  EmptyDataModel? get emptyDataModel => _emptyDataModel;

  ///calling APIs Functions

  Future<ApiResponse> getAllHabitsAPI (BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.goodDeedsRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _habitsModel = HabitsModel.fromJson(responseModel.response?.data);

      if (_habitsModel?.status == 200) {
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));

      } else {
        ToastUtils.showToast(_habitsModel?.message.toString() ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> habitsPostAPI (BuildContext context,String status, goodDeedId) async {
    _isLoading = true;
    notifyListeners();
    HabitsBody habitsBody=HabitsBody();
    habitsBody.status=status;
    habitsBody.goodDeedId=goodDeedId;
    ApiResponse responseModel = await homeRepo.goodDeedsPostRepo(habitsBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);

      if (_emptyDataModel?.status == 200) {
        getAllHabitsAPI(context);
        ToastUtils.showToast('تم تحديد الحالة بنجاح');
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));

      } else {
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
