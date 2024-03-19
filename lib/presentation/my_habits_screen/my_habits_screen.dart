import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/my_habits_screen/widget/select_habits_appBar.dart';
import 'package:islamic_app/presentation/register_screen/widget/top_appbar.dart';

import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../component/images/network_image.dart';
import '../component/svg_icon.dart';

class MyHabitsScreen extends StatefulWidget {
  const MyHabitsScreen({Key? key}) : super(key: key);

  @override
  _MyHabitsScreenState createState() => _MyHabitsScreenState();
}

class _MyHabitsScreenState extends State<MyHabitsScreen> {
  int? isClicked;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(color: AppColors.primaryColor,
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TopAppBar(logo: Assets.habitsLogo, title: 'اهلا بك في صفحة العادات الجيدة',
             label: 'تمكنك هذه الصفحة من متابعة عادادتك الجيدة',
             date: 'الأربعاء 25 شعبان 1445',),
              SelectHabitsAppBar()
          ],),
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
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AppNetworkImage(imageUrl:Assets.selectedRegister,width: 32.w,height: 32.h,borderRadius: 4.r,),
                                    SizedBox(width: 5.w,),
                                    Text('اذكار الصباح',
                                      style: TextStyles()
                                          .getTitleStyle(fontSize: 14.sp)
                                          .customColor(AppColors.black),
                                    )
                                  ],
                                ),
                                SizedBox(width: 50.w,),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        isClicked=1;
                                      });
                                    },
                                    child: Icon((isClicked==1)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (isClicked==1)?AppColors.second:AppColors.gray,)
                                ),SizedBox(width: 35.w,),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        isClicked=2;
                                      });
                                    },
                                    child: Icon((isClicked==2)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 30.r,color: (isClicked==2)?AppColors.second:AppColors.gray,)
                                ),
                              ],),
                          )
                          )));
                }),
          ),
        )
      ],
    ));
  }
}
