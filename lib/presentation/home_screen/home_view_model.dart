
import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/showToast.dart';
import 'package:islamic_app/data/model/response/imsakia_model.dart';
import 'package:islamic_app/data/repository/home_Repo.dart';
import 'package:islamic_app/data/repository/tools_Repo.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../core/api_checker.dart';
import '../../data/model/response/analysis_model.dart';
import '../../data/model/response/base/api_response.dart';
import '../../data/model/response/hadith_model.dart';
import '../../data/model/response/notification_model.dart';
import '../../data/model/response/percentage_model.dart';
import '../../data/model/response/remembrance_details_model.dart';
import '../../data/model/response/remembrance_model.dart';
import '../../data/model/response/remembrance_model.dart';
import '../../data/model/response/supplication_details_model.dart';

class HomeViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final SaveUserData saveUserData;

  HomeViewModel({required this.saveUserData,required this.homeRepo, });

  ///variables
  bool _isLoading = false;
  bool _isLoad = false;

  PercentageModel? _percentageModel;
  AnalysisModel? _analysisModel;




  // TextEditingController rosaryTextController =TextEditingController();
  // List <String> rosaryItems =[];


  ///getters
  bool get isLoading => _isLoading;
  bool get isLoad => _isLoad;


  ///setters

  PercentageModel? get percentageModel => _percentageModel;
  AnalysisModel? get analysisModel => _analysisModel;





  ///calling APIs Functions

  Future<ApiResponse> percentageAPI(BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.percentageHomeRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _percentageModel = PercentageModel.fromJson(responseModel.response?.data);
if(_percentageModel?.status==200){}
else{
  ToastUtils.showToast(_percentageModel?.message.toString()??'');
}
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> analysisAPI(BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await homeRepo.analysisHomeRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _analysisModel = AnalysisModel.fromJson(responseModel.response?.data);
if(_analysisModel?.status==200){}
else{
  ToastUtils.showToast(_analysisModel?.message.toString()??'');
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
