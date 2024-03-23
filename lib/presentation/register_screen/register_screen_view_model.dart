import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic_app/data/model/body/login_body.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../data/repository/auth_repo.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/response/user_model.dart';
import '../../core/api_checker.dart';
import '../../data/model/response/prayers_model.dart';
import '../../data/repository/home_Repo.dart';

class RegisterScreenViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;

  RegisterScreenViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isLoading = false;

  PrayersModel? _prayersModel;

  // final TextEditingController userNameController = TextEditingController();

  ///getters
  bool get isLoading => _isLoading;

  ///setters

  PrayersModel? get prayersModel => _prayersModel;

  ///calling APIs Functions

  Future<ApiResponse> prayersAPI (BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.prayersRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _prayersModel = PrayersModel.fromJson(responseModel.response?.data);

      if (_prayersModel?.status == 200) {
        // await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));

      } else {
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

  refreshData(){
    notifyListeners();
  }
}
