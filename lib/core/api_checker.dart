import 'package:flutter/material.dart';
import 'package:islamic_app/core/routing/route.dart';
import '../data/model/response/base/api_response.dart';
import 'package:provider/provider.dart';

import '../data/repository/SaveUserData.dart';
import '../presentation/auth/login/login.dart';


class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    print("ooooo____${apiResponse.error.toString()}");
    print("ooooo____${apiResponse.response?.statusCode}");
    // if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
    if(apiResponse.response?.statusCode == 401) {
    // back to login and remove data
      Provider.of<SaveUserData>(context,listen: false).clearSharedData();
        push(Login());
    }else {
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      print(_errorMessage);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}