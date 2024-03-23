import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_colors.dart';

class ColorCard extends StatefulWidget {
  const ColorCard({Key? key}) : super(key: key);

  @override
  _ColorCardState createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                height:25.h,width: 25.w,
                decoration: BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(100.r)),),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                height:25.h,width: 25.w,
                decoration: BoxDecoration(color: Color(0xffF59C34),borderRadius: BorderRadius.circular(100.r)),),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                height:25.h,width: 25.w,
                decoration: BoxDecoration(color: Color(0xff4D3B6B),borderRadius: BorderRadius.circular(100.r)),),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                height:25.h,width: 25.w,
                decoration: BoxDecoration(color: Color(0xff15244F),borderRadius: BorderRadius.circular(100.r)),),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                height:25.h,width: 25.w,
                decoration: BoxDecoration(color: Color(0xff30AD23),borderRadius: BorderRadius.circular(100.r)),)
            ],)
          ],),
      ),);
  }
}
