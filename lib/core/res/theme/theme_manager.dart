
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import 'styles_manager.dart';

ThemeData getAppTheme(){
  return ThemeData(
    //لالالالالالالالالالالالالالا

    //لالالالالالالالالالالالالالا
    //main color
    primaryColor: AppColors.primaryColor,
    disabledColor:AppColors.primaryColor,
    splashColor:AppColors.primaryColor,//ripple effect
    //TEXT HEME

    // INPUT DECORATION THEME

    //APP BAR THEME
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primaryColor,
        elevation: AppSize.s4,
        shadowColor: AppColors.primaryColor,
        titleTextStyle: getRegularStyle(color: AppColors.primaryColor,fontSize: FontSize.s16)
      ),

    //BUTTON THEME
      buttonTheme:  ButtonThemeData(
        ///StadiumBorder is 1/2 circle
        shape: StadiumBorder(
        ),
        buttonColor: AppColors.primaryColor,
        splashColor: AppColors.primaryColor,
        disabledColor: AppColors.primaryColor,
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: AppColors.primaryColor,

        ),

     //   primary: AppColors.primaryColor,
        ),

    ),

    //CARED THEME
    cardTheme: CardTheme(
      color: AppColors.primaryColor,
      shadowColor: AppColors.primaryColor,
      elevation: AppSize.s4,
    )

  );
}