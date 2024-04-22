import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic_app/data/model/body/register_body.dart';
import 'package:islamic_app/data/model/response/base/emptyDataModel.dart';
import 'package:islamic_app/presentation/auth/login/login.dart';

import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../data/repository/auth_repo.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/response/user_model.dart';
import '../../core/api_checker.dart';
import '../../core/routing/route.dart';
import '../../data/model/body/login_body.dart';
import '../button_nav_bar/ButtonNavBar.dart';
import '../firebase_notification/FirebaseNotificationHandler.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepo authRepo;
  final SaveUserData saveUserData;

  AuthViewModel({required this.saveUserData, required this.authRepo});

  ///variables
  bool _isLoading = false;
  bool _isSocialLoading = false;

  UserModel? _userModel;
  EmptyDataModel? _emptyDataModel;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordRegisterController = TextEditingController();

  ///getters
  bool get isLoading => _isLoading;
  bool get isSocialLoading => _isSocialLoading;

  ///setters

  UserModel? get userModel => _userModel;
  EmptyDataModel? get emptyDataModel => _emptyDataModel;


  ///calling APIs Functions
  Future<ApiResponse> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
     LoginBody _body = LoginBody();
      _body.email=emailController.text;
      _body.password=passwordController.text;
    ApiResponse responseModel = await authRepo.loginRepo(_body);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.status == 200) {
        if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
        }
        ToastUtils.showToast(_userModel?.message.toString()??'');
         updateFCMToken();
        pushAndRemoveUntil(const BottomNavigationBarApp());
      } else if(_userModel?.status==422) {
        ToastUtils.showToast(_userModel?.message.toString()??'');
      }else{
        ToastUtils.showToast(_userModel?.message.toString()??'');
      }
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> loginSocial(BuildContext context,String email) async {
    _isSocialLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.loginSocialRepo(email);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isSocialLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.status == 200) {
        if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
        }
        ToastUtils.showToast(_userModel?.message.toString()??'');
         updateFCMToken();
        pushAndRemoveUntil(const BottomNavigationBarApp());
      } else{
        registerSocial(context,email);
        // ToastUtils.showToast(_userModel?.message.toString()??'');
      }
      _isSocialLoading = false;
      notifyListeners();
    } else {
      _isSocialLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isSocialLoading = false;
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> registerSocial(BuildContext context,String email) async {
    _isSocialLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.registerSocialRepo(email);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isSocialLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.status == 200) {
        if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
         updateFCMToken();
        }
        ToastUtils.showToast(_userModel?.message.toString()??'');
        pushAndRemoveUntil(const BottomNavigationBarApp());
      } else if(_userModel?.status==422) {
        ToastUtils.showToast(_userModel?.message.toString()??'');
      }else{
        ToastUtils.showToast(_userModel?.message.toString()??'');
      }
      _isSocialLoading = false;
      notifyListeners();
    } else {
      _isSocialLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isSocialLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> register(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
     RegisterBody _body = RegisterBody();
      _body.email=emailRegisterController.text;
      _body.name=nameController.text;
      _body.phone=phoneController.text;
      _body.password=passwordRegisterController.text;
    ApiResponse responseModel = await authRepo.registerRepo(_body);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.status == 200) {
        if (_userModel?.data?.id != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
          // await authRepo.updateFCMToken(fcmToken: fcmToken);
        }
        ToastUtils.showToast(_userModel?.message.toString()??'');
         updateFCMToken();
        pushAndRemoveUntil(const BottomNavigationBarApp());
      } else if(_userModel?.status==422) {
        ToastUtils.showToast(_userModel?.message.toString()??'');
      }else{
        ToastUtils.showToast(_userModel?.message.toString()??'');
      }
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> logout (BuildContext context) async {
    String? fcmToken = await FirebaseMessagingService().getToken();
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.logout(fcmToken: fcmToken??'');
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if (_emptyDataModel != null && _emptyDataModel?.status == 200) {
          saveUserData.clearSharedData();
        ToastUtils.showToast(_emptyDataModel?.message.toString()??'');
        updateFCMToken();
        pushAndRemoveUntil(const Login());
      } else if(_userModel?.status==422) {
        ToastUtils.showToast(_emptyDataModel?.message.toString()??'');
      }else{
        ToastUtils.showToast(_emptyDataModel?.message.toString()??'');
      }
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  // Future<bool> sendOTPFirebase(BuildContext context,String phone) async {
  //   _isLoading=true;
  //   notifyListeners();
  //   bool successfully = false;
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '${_phoneCode?? ''}$phone',
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {
  //       ToastUtils.showToast(e.message ?? 'Error');
  //       successfully = false;
  //       _isLoading = false;
  //       notifyListeners();
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       _verificationId=verificationId;
  //       // _body.updateVerificationId(verificationId);
  //       // log(_tag, 'codeSent');
  //
  //       successfully = true;
  //       _isLoading = false;
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
  //       _isLoading = false;
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
  //         ToastUtils.showToast(LocaleKeys.codeIsWrong.tr());
  //       }
  //     });
  //     _isLoading = false;
  //     notifyListeners();
  //     return true;
  //   }catch(e){
  //     _isLoading = false;
  //     ToastUtils.showToast(LocaleKeys.codeIsWrong.tr());
  //     notifyListeners();
  //     return false;
  //   }
  // }
  //
  Future<void> updateFCMToken() async {
    print("kkkkkkffffk");
    String? fcmToken = await FirebaseMessagingService().getToken();
    if (fcmToken == null) {return;}
    await authRepo.updateFCMToken(fcmToken: fcmToken);
    notifyListeners();
  }
}
