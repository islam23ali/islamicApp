import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic_app/data/model/body/login_body.dart';
import 'package:islamic_app/data/model/response/regions_model.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../data/repository/auth_repo.dart';
import '../../../core/routing/route.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/response/user_model.dart';
import '../../core/api_checker.dart';
import '../../data/model/response/countries_model.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepo authRepo;
  final SaveUserData saveUserData;

  AuthViewModel({required this.saveUserData, required this.authRepo});

  ///variables
  bool _isLoading = false;
  bool _loading = false;
  String? _validationMSG;
  String _phoneCode = '+966';

 late String _verificationId ;
  UserModel? _userModel;
  RegionsModel? _regionsModel;
  CountriesModel? _countriesModel;

  //login
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBarthController = TextEditingController();

  bool _isClicked = false;



  int? countryId;
  int? countryIndex;

  int? stateIndex;
  int? stateId;
  String? stateName;

  int? cityIndex;
  int? cityId;
  String? cityName;

  int? areaIndex;
  int? areaId;
  String? areaName;

  String? sexType;
  bool? isSexSelect;
  ///getters
  bool get isLoading => _isLoading;
  bool get loading => _loading;

  String? get validationMSG => _validationMSG;

  String get phoneCode => _phoneCode;

  bool get isClicked => _isClicked;

  ///setters

  UserModel? get userModel => _userModel;
  RegionsModel? get regionsModel => _regionsModel;
  CountriesModel? get countriesModel => _countriesModel;

  set validationMsg(String msg) {
    _validationMSG = msg;
    notifyListeners();
  }

  set phoneCodeCountry(String phoneCode) {
    _phoneCode = phoneCode;
    notifyListeners();
  }

  bool isClickedAction() {
    notifyListeners();
    return _isClicked = !_isClicked;
  }

  ///calling APIs Functions

  Future<ApiResponse> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    LoginBody loginBody=LoginBody();
    loginBody.username=userNameController.text;
    loginBody.password=passwordController.text;
    ApiResponse responseModel = await authRepo.loginRepo(loginBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.code == 200){
        if (_userModel?.data?.id != null){
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
          print('kkkkkkkkkkk${saveUserData.getUserData()?.data?.id}');
          // await authRepo.updateFCMToken();
        }
        ToastUtils.showToast(_userModel?.message??'');
        // showModalBottomSheet(
        //   backgroundColor: Colors.transparent,
        //   isScrollControlled: true,
        //   context: context,
        //   builder: (BuildContext context) => ConfirmCodeSheet(phone: phone),);
         // updateFCMToken();
        // if(_userModel?.data?.type=='store_keeper'){
        //   push(HomeStoreKeeper());
        // }else if(_userModel?.data?.type=='captain'){
        //   push(DeliveryHome());
        // }else if(_userModel?.data?.type=='site_supervisor'){
        //   push(SiteSupervisorHome());
        // }else if(_userModel?.data?.type=='quality_specialist'){
        //   push(QualitySpecialistHome());
        // }else if(_userModel?.data?.type=='association_supervisor'){
        //   push(AssociationSupervisorHome());
        // }else if(_userModel?.data?.type=='field_supervisor'){
        //   push(HomeSupervisor());
        // }else if(_userModel?.data?.type=='general_supervisor'){
        //   push(HomeSupervisor());
        // }else if(_userModel?.data?.type=='director_association'){
        //   push(HomeDirector());
        // }
        // pushAndRemoveUntil(const FavoriteSportsPage(fromSetting: false,));
      }
      else{
        ToastUtils.showToast(_userModel?.message??'');
      }

    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  // Future<ApiResponse> register(BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   RegisterBody? _registerBody=RegisterBody();
  //   _registerBody.countryId=countryId.toString();
  //   _registerBody.phone=phoneController.text;
  //   _registerBody.type='client';
  //   _registerBody.name=firstNameController.text+lastNameController.text;
  //   _registerBody.email=emailController.text;
  //   _registerBody.birthdate=dateOfBarthController.text;
  //   _registerBody.gender=sexType;
  //   _registerBody.governmentId=stateId.toString();
  //   _registerBody.cityId=cityId.toString();
  //   _registerBody.areaId=areaId.toString();
  //
  //   ApiResponse responseModel = await authRepo.registerRepo(_registerBody);
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _isLoading = false;
  //     _userModel = UserModel.fromJson(responseModel.response?.data);
  //
  //     if (_userModel != null && _userModel?.code == 200) {
  //       if (_userModel?.data?.id != null) {
  //         saveUserData.saveUserData(_userModel!);
  //         saveUserData.saveUserToken(_userModel?.data?.token ?? '');
  //       }
  //       ToastUtils.showToast(_userModel?.message ?? "");
  //       // updateFCMToken();
  //       // pushAndRemoveUntil(const FavoriteSportsPage(fromSetting: false));
  //     } else {
  //       ToastUtils.showToast(_userModel?.message ?? "");
  //     }
  //   } else {
  //     _isLoading = false;
  //     ApiChecker.checkApi(context, responseModel);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

  // Future<ApiResponse> updateProfile(
  //     BuildContext context, UpdateProfileBody? updateProfileBody) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse responseModel = await authRepo.updateProfile(updateProfileBody);
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _isLoading = false;
  //     _userModel = UserModel.fromJson(responseModel.response?.data);
  //     if (_userModel != null && _userModel?.code == 200) {
  //       if (_userModel?.data?.user?.id != null) {
  //       await  saveUserData.saveUserData(_userModel!);
  //        await saveUserData.saveUserToken(_userModel?.data?.auth?.token ?? '');
  //       }
  //       ToastUtils.showToast('YourInformationSuccessfullyModified'.tr());
  //       Navigator.pop(context);
  //       // _updateFCMToken();
  //     } else {
  //       ToastUtils.showToast(_userModel?.message ?? "");
  //     }
  //   } else {
  //     _isLoading = false;
  //     ApiChecker.checkApi(context, responseModel);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

  // Future<ApiResponse> logout(
  //   BuildContext context,
  // ) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse responseModel = await authRepo.logout();
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _isLoading = false;
  //     _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
  //
  //     if (_emptyDataModel?.code == 200) {
  //       await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));
  //
  //     } else {
  //       ToastUtils.showToast(_emptyDataModel?.message ?? "");
  //     }
  //   } else {
  //     _isLoading = false;
  //     ApiChecker.checkApi(context, responseModel);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

  // Future<ApiResponse> deleteAccount(
  //   BuildContext context,
  // ) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse responseModel = await authRepo.deleteAccount();
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _isLoading = false;
  //     _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
  //     if (_emptyDataModel?.code == 200) {
  //       await saveUserData.clearSharedData().then((value) => pushAndRemoveUntil(const Splash()));
  //
  //     } else {
  //       ToastUtils.showToast(_emptyDataModel?.message ?? "");
  //     }
  //   } else {
  //     _isLoading = false;
  //     ApiChecker.checkApi(context, responseModel);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

  // Future<bool> sendOTPFirebase(BuildContext context,String phone) async {
  //   _loading=true;
  //   notifyListeners();
  //   bool successfully = false;
  //   if (_phoneCode == null ) return false;
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '${_phoneCode?? ''}$phone',
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {
  //       ToastUtils.showToast(e.message ?? 'Error');
  //       successfully = false;
  //       _loading = false;
  //       notifyListeners();
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       _verificationId=verificationId;
  //       // _body.updateVerificationId(verificationId);
  //       // log(_tag, 'codeSent');
  //
  //       successfully = true;
  //       _loading = false;
  //       notifyListeners();
  //       showModalBottomSheet(
  //         backgroundColor: Colors.transparent,
  //         isScrollControlled: true,
  //         context: context,
  //         builder: (BuildContext context) => ConfirmCodeSheet(phone: phone),
  //       );
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       successfully = false;
  //       _loading = false;
  //       notifyListeners();
  //     },
  //   );
  //
  //   return successfully;
  // }
  // Future<bool> verifyOTPFirebase(String smsCode,String phone,BuildContext context) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   try{
  //     // Create a PhoneAuthCredential with the code
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:_verificationId, smsCode: smsCode);
  //     // Sign the user in (or link) with the credential
  //     await FirebaseAuth.instance.signInWithCredential(credential).then((result) {
  //       if (result.user != null) {
  //         login(phone:phone , context: context);
  //       }else{
  //         ToastUtils.showToast(LocaleKeys.confirm.tr());
  //       }
  //     });
  //     _isLoading = false;
  //     notifyListeners();
  //     return true;
  //   }catch(e){
  //     _isLoading = false;
  //     ToastUtils.showToast(LocaleKeys.addToCart.tr());
  //     notifyListeners();
  //     return false;
  //   }
  // }

  // Future<void> updateFCMToken() async {
  //   print("kkkkkkffffk");
  //   String? fcmToken = await NotificationServices().getDeviceToken();
  //   if (fcmToken == null) {return;}
  //   await authRepo.updateFCMToken(fcmToken: fcmToken);
  //   notifyListeners();
  // }
  refreshData(){
    notifyListeners();
  }
}
