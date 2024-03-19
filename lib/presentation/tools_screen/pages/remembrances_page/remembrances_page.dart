import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/component/component.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../component/svg_icon.dart';

class RemembrancesPage extends StatefulWidget {
  const RemembrancesPage({Key? key}) : super(key: key);

  @override
  _RemembrancesPageState createState() => _RemembrancesPageState();
}

class _RemembrancesPageState extends State<RemembrancesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      topColor: AppColors.primaryColor,
      topColorIcon: Brightness.light,
      titleColor: AppColors.white,
      color: AppColors.primaryColor,title: LocaleKeys.remembrances.tr(),isBackButtonExist: false,
      actions: [InkWell(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal:16.w),
        child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.white,size: 26.r,),
    ),
      )],),
      body:Padding(
        padding: EdgeInsets.all(12.r),
        child: AnimationLimiter(
          child:ListView.builder(
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
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                              margin: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 20.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r),border: Border.all(width: 1.w,color: AppColors.primaryColor),color: Colors.blue.shade50),
                              child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('bsdjsbasjkgfhjlrv gnioercjfoihrngihrjngvihsdrnbfwekalseksqw;lkedpoewhjfbuykrsjhcjfmpoqewnvj98gy45bv89y57yubvw8nrnqfjrw8ubht98reuhigjslcwfnrbajetvbrstuiobcungxriubecgjniostubjvitucbwnr79qcuwihndk',
                                    style: TextStyles()
                                        .getRegularStyle(fontSize: 16.sp)
                                        .customColor(AppColors.black),
                                  ),
                                ],
                              ) ,),
                            Positioned(bottom: 5,left: 25,
                                child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
                              margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 1.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(width: 1.w,color: AppColors.primaryColor),color: Colors.blue),
                              child:Text(
                                'hghghghgg',style: TextStyles()
                                    .getRegularStyle(fontSize: 16.sp)
                                    .customColor(AppColors.white),
                              ) ,))
                          ],
                        )
                        )));
              }),
        ),
      ) ,);
  }
}
