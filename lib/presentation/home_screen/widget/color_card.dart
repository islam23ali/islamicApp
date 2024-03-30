import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/core/routing/route.dart';
import 'package:islamic_app/data/repository/SaveUserData.dart';
import 'package:islamic_app/injection.dart';
import 'package:islamic_app/presentation/splash/splash.dart';
import 'package:restart_app/restart_app.dart';

import '../../../core/logger.dart';
import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_colors.dart';
SaveUserData saveData =getIt();
class ColorCard extends StatefulWidget {
  const ColorCard({Key? key}) : super(key: key);

  @override
  _ColorCardState createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  // final tag = 'ChangeLanguageSheet';
  // late Locale locale = context.locale;
  @override
  Widget build(BuildContext context) {
    return Card(color: AppColors.white,
      surfaceTintColor: Colors.white,
      shadowColor: AppColors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.w, color: AppColors.grayLight),
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(LocaleKeys.chooseAppColor.tr(),style: TextStyles().getRegularStyle(fontSize: 14.sp).customColor(AppColors.black),),
            Row(children: [
              InkWell(onTap: (){
                setState(() {
                  saveData.saveColor('1').then((value) => pushAndRemoveUntil(Splash()));
                });
                Restart.restartApp(webOrigin: '[your main route]');
                // context.setLocale(locale) ;
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  // padding: EdgeInsets.all( 2.r),
                  height:25.h,width: 25.w,
                  decoration: BoxDecoration(color: Color(0xff2295F2),borderRadius: BorderRadius.circular(100.r)),
                  child: Center(child: Icon(Icons.done_rounded,color:saveData.getColor()!='1'?Colors.transparent: AppColors.white,size: 20.r,)),),
              ),
              InkWell(onTap: (){
                setState(() {
                  saveData.saveColor('2').then((value) => pushAndRemoveUntil(Splash()));
                });
                // context.setLocale(locale) ;
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  height:25.h,width: 25.w,
                  decoration: BoxDecoration(color: Color(0xffF59C34),borderRadius: BorderRadius.circular(100.r)),
                  child: Center(child: Icon(Icons.done_rounded,color:saveData.getColor()!='2'?Colors.transparent: AppColors.white,size: 20.r,)),),
              ),
              InkWell(onTap: (){
                setState(() {
                  saveData.saveColor('3').then((value) => pushAndRemoveUntil(Splash()));
                });
                // context.setLocale(locale) ;
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  height:25.h,width: 25.w,
                  decoration: BoxDecoration(color: Color(0xff4D3B6B),borderRadius: BorderRadius.circular(100.r)),
                  child: Center(child: Icon(Icons.done_rounded,color: saveData.getColor()!='3'?Colors.transparent:AppColors.white,size: 20.r,)),),
              ),
              InkWell(onTap: (){
                setState(() {
                  saveData.saveColor('4').then((value) => pushAndRemoveUntil(Splash()));
                });
                // context.setLocale(locale) ;
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  height:25.h,width: 25.w,
                  decoration: BoxDecoration(color: Color(0xff15244F),borderRadius: BorderRadius.circular(100.r)),
                  child: Center(child: Icon(Icons.done_rounded,color:saveData.getColor()!='4'?Colors.transparent: AppColors.white,size: 20.r,)),),
              ),
              InkWell(onTap: (){
                setState(() {
                  saveData.saveColor('5').then((value) => pushAndRemoveUntil(Splash()));
                });
                // context.setLocale(locale) ;
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  height:25.h,width: 25.w,
                  decoration: BoxDecoration(color: Color(0xff30AD23),borderRadius: BorderRadius.circular(100.r)),
                  child: Center(child: Icon(Icons.done_rounded,color:saveData.getColor()!='5'?Colors.transparent: AppColors.white,size: 20.r,)),),
              )
            ],)
          ],),
      ),);
  }
}
