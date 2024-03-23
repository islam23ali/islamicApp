
import 'package:flutter/material.dart';
import 'package:islamic_app/data/repository/home_Repo.dart';
import 'package:islamic_app/data/repository/tools_Repo.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../core/api_checker.dart';
import '../../data/model/response/base/api_response.dart';
import '../../data/model/response/hadith_model.dart';
import '../../data/model/response/remembrance_details_model.dart';
import '../../data/model/response/remembrance_model.dart';
import '../../data/model/response/remembrance_model.dart';
import '../../data/model/response/supplication_details_model.dart';

class ToolsViewModel with ChangeNotifier {
  final ToolsRepo toolsRepo;
  final SaveUserData saveUserData;

  ToolsViewModel({required this.saveUserData,required this.toolsRepo, });

  ///variables
  bool _isLoading = false;

  HadithModel? _hadithModel;
  RemembranceModel? _remembranceModel;
  RemembranceDetailsModel? _remembranceDetailsModel;
  SupplicationsDetailsModel? _supplicationsDetailsModel;




  TextEditingController rosaryTextController =TextEditingController();
  List <String> rosaryItems =[];


  ///getters
  bool get isLoading => _isLoading;


  ///setters

  HadithModel? get hadithModel => _hadithModel;
  RemembranceModel? get remembranceModel => _remembranceModel;
  RemembranceModel? get supplicationModel => _remembranceModel;
  RemembranceDetailsModel? get remembranceDetailsModel => _remembranceDetailsModel;
  SupplicationsDetailsModel? get supplicationsDetailsModel => _supplicationsDetailsModel;





  ///calling APIs Functions

  Future<ApiResponse> getAllHadithAPI(BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await toolsRepo.hadithRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _hadithModel = HadithModel.fromJson(responseModel.response?.data);


    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getAllRemembranceAPI(BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await toolsRepo.remembranceRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _remembranceModel = RemembranceModel.fromJson(responseModel.response?.data);


    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getAllRemembranceDetailsAPI(BuildContext context,String remembranceId) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await toolsRepo.remembranceDetailsRepo(remembranceId);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _remembranceDetailsModel = RemembranceDetailsModel.fromJson(responseModel.response?.data);


    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getAllSupplicationAPI(BuildContext context) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await toolsRepo.supplicationRepo();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _remembranceModel = RemembranceModel.fromJson(responseModel.response?.data);


    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getAllSupplicationDetailsAPI(BuildContext context,String supplicationId) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await toolsRepo.supplicationDetailsRepo(supplicationId);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _supplicationsDetailsModel = SupplicationsDetailsModel.fromJson(responseModel.response?.data);


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
