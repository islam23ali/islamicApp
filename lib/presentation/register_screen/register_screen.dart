import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/register_screen/widget/top_appbar.dart';

import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  bool checkBoxValue=false;
  int? isClicked;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: AppColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const TopAppBar(logo: Assets.praying, title: 'انتبه! لم تصلي الفجر بعد',
                 label: 'الصلاة القادمة: الظهر 3 ساعات و 4 دقائق',
                 date: 'الأربعاء 25 شعبان 1445',),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                  height: 90.h,
                  child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                          // width: 75.h,
                          child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                        Column(
                          children: [
                            SVGIcon(Assets.expandLess,width: 24.w,height: 20.h,color: AppColors.white),
                            SVGIcon(Assets.expandMore,width: 24.w,height: 20.h,color: AppColors.white,),
                          ],
                        ),
                        SizedBox(width: 16.w,),
                        Text(
                          'اليوم',
                          style: TextStyles()
                              .getDisplayMediumStyle(fontSize: 14.sp)
                              .customColor(AppColors.white),
                        ),
                      ],)),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 11.w),
                              height: 61.h,width: 40.w,
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround
                                ,children: [
                                Text(
                                  'جماعة',
                                  style: TextStyles()
                                      .getDisplayMediumStyle(fontSize: 10.sp)
                                      .customColor(AppColors.white),
                                ),
                                AppNetworkImage(imageUrl:Assets.selectedRegister,width: 40.w,height: 40.h,borderRadius: 4.r,),
                              ],),);

                          },
                        ),
                      ),
                    ],
                  ) ,)
              ],
            ),
          ),
          Expanded(
            child: AnimationLimiter(
              child:ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return AnimationConfiguration.staggeredGrid(
                        duration:const Duration(milliseconds: 900),
                        position: index,
                        columnCount: 1,
                        child: ScaleAnimation(
                            duration:const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(child:
                            Container(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      AppNetworkImage(imageUrl:Assets.selectedRegister,width: 32.w,height: 32.h,borderRadius: 4.r,),
                                      SizedBox(width: 5.w,),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text('الفجر',
                                          style: TextStyles()
                                              .getTitleStyle(fontSize: 14.sp)
                                              .customColor(AppColors.black),
                                        ),
                                        Text('6:14 ص',
                                          style: TextStyles()
                                              .getRegularStyle(fontSize: 10.sp)
                                              .customColor(AppColors.black),
                                        ),
                                      ],)
                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        isClicked=1;
                                      });
                                    },
                                      child: Icon((isClicked==1)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (isClicked==1)?AppColors.second:AppColors.gray,)
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        isClicked=2;
                                      });
                                    },
                                      child: Icon((isClicked==2)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (isClicked==2)?AppColors.second:AppColors.gray,)
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        isClicked=3;
                                      });
                                    },
                                      child: Icon((isClicked==3)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (isClicked==3)?AppColors.second:AppColors.gray,)
                                  ),
                                  Checkbox(value: checkBoxValue,
                                      activeColor: AppColors.second,
                                      onChanged:(bool? newValue){
                                        setState(() {
                                          checkBoxValue = !checkBoxValue;
                                        });
                                        Text('Remember me');
                                      }),
                                ],),
                            )
                            )));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
