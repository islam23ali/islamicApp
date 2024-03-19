import 'package:flutter/material.dart';
import 'package:islamic_app/core/resources/app_assets.dart';

class MyProviderQuraan extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

 void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
  void changeTheme(ThemeMode mode){
   themeMode=mode;
   notifyListeners();
  }
  String getbackgroundPath(){
   if(themeMode==ThemeMode.light){
     return Assets.quraan;
   }else{
     return Assets.notifications;
   }
  }
}
