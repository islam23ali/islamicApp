import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/res/text_styles.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/home_screen/widget/color_card.dart';
import 'package:islamic_app/presentation/home_screen/widget/top_card_home.dart';
import 'dart:math' as math;

import '../component/custom_circle_pant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              color: AppColors.white,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'الأربعاء 25 شعبان 1445',
                      style: TextStyles()
                          .getTitleStyle(fontSize: 16.sp)
                          .customColor(AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
            const ColorCard(),
            const TopCardHome(),
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: AppColors.grayLight),
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الموجز',
                          style: TextStyles()
                              .getTitleStyle(fontSize: 18.sp)
                              .customColor(AppColors.primaryColor),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29.r),
                                color: AppColors.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.day.tr(),
                                  style: TextStyles()
                                      .getRegularStyle(fontSize: 12.sp)
                                      .customColor(AppColors.white),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29.r),
                                color: AppColors.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.week.tr(),
                                  style: TextStyles()
                                      .getRegularStyle(fontSize: 12.sp)
                                      .customColor(AppColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 80.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomPaint(
                          size: const Size(100, 100), // no effect while adding child
                          painter: CustomCircularPaint(
                            progressValue: .5, //[0-1]
                          ),
                          child: Card(
                            margin: EdgeInsets.all(6.r),
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: AppColors.grayLight),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            elevation: 3,
                            child: Container(
                              height:92.h,width: 92.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                              child: Center(child: Text('%50',style: TextStyles().getTitleStyle(fontSize: 24.sp).customColor(AppColors.black),)),),
                          ),
                        ),
                          SizedBox(height: 20.h,),
                          Text('صلاة الفرض',style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                      ],),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomPaint(
                          // size: const Size(100, 100), // no effect while adding child
                          painter: CustomCircularPaint(
                            progressValue: .5, //[0-1]
                          ),
                          child: Card(
                            margin: EdgeInsets.all(6.r),
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: AppColors.grayLight),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            elevation: 3,
                            child: Container(
                              height:92.h,width: 92.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                              child: Center(child: Text('%50',style: TextStyles().getTitleStyle(fontSize: 24.sp).customColor(AppColors.black),)),),
                          ),
                        ),
                          SizedBox(height: 20.h,),
                          Text('صلاة الفرض',style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                      ],),
                    ],)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}