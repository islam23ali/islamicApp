import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../component/svg_icon.dart';

class SelectHabitsAppBar extends StatefulWidget {
  const SelectHabitsAppBar({Key? key}) : super(key: key);

  @override
  _SelectHabitsAppBarState createState() => _SelectHabitsAppBarState();
}

class _SelectHabitsAppBarState extends State<SelectHabitsAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      height: 90.h,
      child:Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
              // width: 75.h,
              child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(width: 24.w,height: 20.h,)
                      // SVGIcon(Assets.expandLess,width: 24.w,height: 20.h,color: AppColors.second),
                      // SVGIcon(Assets.expandMore,width: 24.w,height: 20.h,color: AppColors.white,),
                    ],
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    LocaleKeys.today.tr(),
                    style: TextStyles()
                        .getDisplayMediumStyle(fontSize: 14.sp)
                        .customColor(AppColors.white),
                  ),
                ],)),
          SizedBox(width: 50.w,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            height: 61.h,width: 40.w,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  LocaleKeys.yes.tr(),
                  style: TextStyles()
                      .getDisplayMediumStyle(fontSize: 10.sp)
                      .customColor(AppColors.white),
                ),
                Image.asset(Assets.yes,width: 32.w,height: 32.h,)
                // AppNetworkImage(imageUrl:Assets.selectedRegister,width: 40.w,height: 40.h,borderRadius: 4.r,),
              ],),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            height: 61.h,width: 40.w,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  LocaleKeys.no.tr(),
                  style: TextStyles()
                      .getDisplayMediumStyle(fontSize: 10.sp)
                      .customColor(AppColors.white),
                ),
                Image.asset(Assets.no,width: 32.w,height: 32.h,)
                // AppNetworkImage(imageUrl:Assets.selectedRegister,width: 40.w,height: 40.h,borderRadius: 4.r,),
              ],),)
        ],
      ) ,);
  }
}
