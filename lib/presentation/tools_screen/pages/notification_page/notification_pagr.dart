import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/custom_scaffold.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ToolsViewModel>(context,listen: false).getNotificationAPI(context);
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      topColor: AppColors.primaryColor,
      topColorIcon: Brightness.light,
      titleColor: AppColors.white,
      color: AppColors.primaryColor,title: LocaleKeys.notifications.tr(),isBackButtonExist: false,
      actions: [InkWell(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.white,size: 26.r,),
        ),
      )],),
      body:  Consumer<ToolsViewModel>(builder: (context, data, child) {
        return
    Padding(
        padding: EdgeInsets.all(12.r),
        child: AnimationLimiter(
          child:ListView.builder(
              itemCount: data.notificationModel?.data?.length,
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
                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                          margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color:AppColors.grayLight),
                          child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 50.w,height: 50.h,
                                child: Center(child: Image.asset(Assets.notifications,width: 48.w,height: 48.h)),),
                              SizedBox(width: MediaQuery.of(context).size.width-100,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.notificationModel?.data?[index].title??'',
                                      style: TextStyles()
                                          .getDisplayMediumStyle(fontSize: 14.sp)
                                          .customColor(AppColors.black),
                                    ),
                                    Text(data.notificationModel?.data?[index].body??'',
                                      style: TextStyles()
                                          .getRegularStyle(fontSize: 13.sp)
                                          .customColor(AppColors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ) ,)
                        )));
              }),
        ),
      );}) ,);
  }
}
