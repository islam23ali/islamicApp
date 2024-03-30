import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../core/utils/showToast.dart';
import '../../core/api_checker.dart';
import '../../core/routing/route.dart';
import '../../data/model/response/reports_model.dart';
import '../../data/model/response/title_pages_model.dart';
import '../../data/repository/home_Repo.dart';
import '../splash/splash.dart';

class ReportsScreenViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;

  ReportsScreenViewModel({required this.saveUserData, required this.homeRepo});

  ///variables
  bool _isReLoading = false;
  bool _isLoading = false;

  bool showReport= false;

  ReportsModel? _reportsModel;
  TitlePagesModel? _titlePagesModel;

  final TextEditingController fromDateController = TextEditingController();   /// for view
  final TextEditingController toDateController = TextEditingController();   ///for view
  final TextEditingController fromDateApiController = TextEditingController();  /// for link
  final TextEditingController toDateApiController = TextEditingController();   /// for link


  ///getters
  bool get isReLoading => _isReLoading;
  bool get isLoading => _isLoading;

  ///setters

  ReportsModel? get reportsModel => _reportsModel;
  TitlePagesModel? get titlePagesModel => _titlePagesModel;

  ///calling APIs Functions

  Future<ApiResponse> reportsAPI (BuildContext context) async {
    _isReLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.reportsRepo(fromDateApiController.text,toDateApiController.text);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isReLoading = false;
      _reportsModel = ReportsModel.fromJson(responseModel.response?.data);
      if (_reportsModel?.status == 200) {
        showReport=!showReport;
      }else if(_reportsModel?.status == 401){
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));}
        else{
        ToastUtils.showToast(_reportsModel?.message.toString() ?? "");}
    } else {
      _isReLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isReLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> titlePageAPI (BuildContext context,String type) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.titlePageRepo(type);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _titlePagesModel = TitlePagesModel.fromJson(responseModel.response?.data);
      if (_titlePagesModel?.status == 200) {

      }else if(_titlePagesModel?.status == 401){
        await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));}
        else{
        ToastUtils.showToast(_titlePagesModel?.message.toString() ?? "");}
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
