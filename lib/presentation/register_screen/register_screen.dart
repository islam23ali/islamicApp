
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/app_loader.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/register_screen/register_screen_view_model.dart';
import 'package:islamic_app/presentation/register_screen/widget/top_appbar.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:provider/provider.dart';

import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
@override
  void initState() {
    super.initState();
    Provider.of<RegisterScreenViewModel>(context,listen: false).prayersAPI(context);
    Provider.of<RegisterScreenViewModel>(context,listen: false).getAllAssumptions(context);
    Provider.of<RegisterScreenViewModel>(context,listen: false).nextPrayAPI(context);
  }
  @override
  Widget build(BuildContext context) {
    final load =context.watch<RegisterScreenViewModel>().isLoading;
    return SafeArea(
      child:
        Consumer<RegisterScreenViewModel>(builder: (context, data, child) {
          final jHijri = JHijri(fDate: data.nextPrayerModel?.data?.date).hijri;
      return load? AppLoader(): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: AppColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopAppBar(logo: Assets.praying, title: data.nextPrayerModel?.data?.title??'',
                 label: data.nextPrayerModel?.data?.text??'',
                 date:jHijri.toString() ??'',),
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
                        SizedBox(width: 30.w,
                          // child: Column(
                          //   children: [
                          //     SVGIcon(Assets.expandLess,width: 24.w,height: 20.h,color: AppColors.white),
                          //     SVGIcon(Assets.expandMore,width: 24.w,height: 20.h,color: AppColors.white,),
                          //   ],
                          // ),
                        ),
                        SizedBox(width: 16.w,),
                        Text(
                          LocaleKeys.today.tr(),
                          style: TextStyles()
                              .getDisplayMediumStyle(fontSize: 14.sp)
                              .customColor(AppColors.white),
                        ),
                      ],)),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.assumptionsModel?.data?.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              height: 61.h,width: 50.w,
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                Text(
                                  data.assumptionsModel?.data?[index].title??'',
                                  style: TextStyles()
                                      .getDisplayMediumStyle(fontSize: 10.sp)
                                      .customColor(AppColors.white),
                                ),
                                AppNetworkImage(imageUrl:data.assumptionsModel?.data?[index].image??'',width: 40.w,height: 40.h,borderRadius: 4.r,),
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
            child: (data.prayersModel?.data?.length==0)?NoDataScreen(): AnimationLimiter(
              child:ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                  itemCount: data.prayersModel?.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    String slug =data.prayersModel?.data?[index].slug??'';
                    return AnimationConfiguration.staggeredGrid(
                        duration:const Duration(milliseconds: 900),
                        position: index,
                        columnCount: 1,
                        child: ScaleAnimation(
                            duration:const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(child:
                            SizedBox(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      AppNetworkImage(imageUrl:data.prayersModel?.data?[index].image??'',width: 32.w,height: 32.h,borderRadius: 4.r,),
                                      SizedBox(width: 5.w,),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        SizedBox(width: 80.w,
                                          child: Text(data.prayersModel?.data?[index].title??'',
                                            style: TextStyles()
                                                .getTitleStyle(fontSize: 14.sp)
                                                .customColor(AppColors.black),
                                          ),
                                        ),
                                        Text(data.prayersModel?.data?[index].time??'',
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
                                        data.isClicked=1;
                                        data.isClickedKey=slug;
                                      });
                                    },
                                      child: Icon((data.isClicked==1 && data.isClickedKey==slug)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 25.r,color: (data.isClicked==1 && data.isClickedKey==slug)?AppColors.second:AppColors.gray,)
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        data.isClicked=2;
                                        data.isClickedKey=slug;
                                      });
                                    },
                                      child: Icon((data.isClicked==2 && data.isClickedKey==slug)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 25.r,color: (data.isClicked==2 && data.isClickedKey==slug)?AppColors.second:AppColors.gray,)
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        data.isClicked=3;
                                        data.isClickedKey=slug;
                                      });
                                    },
                                      child: Icon((data.isClicked==3 && data.isClickedKey==slug)?Icons.radio_button_checked_rounded:Icons.radio_button_off_rounded,size: 25.r,color: (data.isClicked==3 && data.isClickedKey==slug)?AppColors.second:AppColors.gray,)
                                  ),
                                  Checkbox(value: data.checkBoxValue,
                                      activeColor: AppColors.second,
                                      onChanged:(bool? newValue){
                                        setState(() {
                                          data.checkBoxValue = !data.checkBoxValue;
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
      );})
    );
  }
}
