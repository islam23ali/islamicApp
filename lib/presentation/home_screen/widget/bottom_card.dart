import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/presentation/home_screen/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../component/custom_circle_pant.dart';

class BottomCard extends StatefulWidget {
  const BottomCard({Key? key}) : super(key: key);

  @override
  _BottomCardState createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  int isSelected=1;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, data, child) {
      double all1 = ( data.percentageModel?.data?.allAssumptionPercentage?.toDouble()??0.0);
      double all2 = ( data.percentageModel?.data?.allSunnahPercentage?.toDouble()??0.0);
      double day1 = ( data.percentageModel?.data?.dayAssumptionPercentage?.toDouble()??0.0);
      double day2 = ( data.percentageModel?.data?.daySunnahPercentage?.toDouble()??0.0);
      double week1 = ( data.percentageModel?.data?.weekAssumptionPercentage?.toDouble()??0.0);
      double week2 = ( data.percentageModel?.data?.weekSunnahPercentage?.toDouble()??0.0);
    return Card(
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
                  LocaleKeys.summary.tr(),
                  style: TextStyles()
                      .getTitleStyle(fontSize: 18.sp)
                      .customColor(AppColors.primaryColor),
                ),
                Row(
                  children: [
                    InkWell(onTap: (){
                      setState(() {
                        isSelected=1;
                      });
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color:(isSelected==1)? AppColors.primaryColor:Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.all.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor((isSelected==1)?AppColors.white:AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(onTap: (){
                      setState(() {
                        isSelected=2;
                      });
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color: (isSelected==2)?AppColors.primaryColor:Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.day.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor((isSelected==2)?AppColors.white:AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(onTap: (){
                      setState(() {
                        isSelected=3;
                      });
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color:(isSelected==3)? AppColors.primaryColor:Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.week.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor((isSelected==3)?AppColors.white:AppColors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80.h,),
            (isSelected==1)?
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(100, 100), // no effect while adding child
                      painter: CustomCircularPaint(
                        progressValue: (all1/100), //[0-1]
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
                          child: Center(child: Text('%${(all1).toPrecision(2)}',style: TextStyles().getTitleStyle(fontSize: 20.sp).customColor(AppColors.black),)),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(LocaleKeys.obligatoryPrayer.tr(),style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      // size: const Size(100, 100), // no effect while adding child
                      painter: CustomCircularPaint(
                        progressValue: (all2/100), //[0-1]
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
                          child: Center(child: Text('%${(all2).toPrecision(2)}',style: TextStyles().getTitleStyle(fontSize: 20.sp).customColor(AppColors.black),)),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(LocaleKeys.supererogatoryPrayer.tr(),style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                  ],),
              ],):
            (isSelected==2)?
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(100, 100), // no effect while adding child
                      painter: CustomCircularPaint(
                        progressValue:(day1/100) , //[0-1]
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
                          child: Center(child: Text('%${(day1).toPrecision(2)}',style: TextStyles().getTitleStyle(fontSize: 20.sp).customColor(AppColors.black),)),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(LocaleKeys.obligatoryPrayer.tr(),style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      // size: const Size(100, 100), // no effect while adding child
                      painter: CustomCircularPaint(
                        progressValue: (day2/100), //[0-1]
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
                          child: Center(child: Text('%${(day2).toPrecision(2)}',style: TextStyles().getTitleStyle(fontSize: 20.sp).customColor(AppColors.black),)),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(LocaleKeys.supererogatoryPrayer.tr(),style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                  ],),
              ],):
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(100, 100), // no effect while adding child
                      painter: CustomCircularPaint(
                        progressValue:(week1/100) , //[0-1]
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
                          child: Center(child: Text('%${(week1).toPrecision(2)}',style: TextStyles().getTitleStyle(fontSize: 20.sp).customColor(AppColors.black),)),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(LocaleKeys.obligatoryPrayer.tr(),style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      // size: const Size(100, 100), // no effect while adding child
                      painter: CustomCircularPaint(
                        progressValue: (week2/100), //[0-1]
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
                          child: Center(child: Text('%${(week2).toPrecision(2)}',style: TextStyles().getTitleStyle(fontSize: 20.sp).customColor(AppColors.black),)),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Text(LocaleKeys.supererogatoryPrayer.tr(),style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                  ],),
              ],),
          ],
        ),
      ),
    );});
  }
}
