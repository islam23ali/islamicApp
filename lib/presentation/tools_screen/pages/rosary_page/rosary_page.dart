import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/core/routing/route.dart';
import 'package:islamic_app/core/utils/showToast.dart';
import 'package:islamic_app/presentation/component/inputs/new/customTextFormField.dart';
import 'package:islamic_app/presentation/tools_screen/pages/rosary_page/add_rosary_sheet.dart';
import 'package:islamic_app/presentation/tools_screen/pages/rosary_page/rosary_child_page.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../injection.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/buttons/custom_button.dart';
import '../../../component/custom_scaffold.dart';
import '../../tools_view_model.dart';
ToolsViewModel provider =getIt();
class Rosary extends StatefulWidget {
  const Rosary({Key? key}) : super(key: key);

  @override
  _RosaryState createState() => _RosaryState();
}

class _RosaryState extends State<Rosary> {
  @override
  void initState() {
    super.initState();
    Provider.of<ToolsViewModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        topColor: AppColors.primaryColor,
        topColorIcon: Brightness.light,
        titleColor: AppColors.white,
        color: AppColors.primaryColor,
        title: LocaleKeys.rosary.tr(),
        isBackButtonExist: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: AppColors.white,
                size: 26.r,
              ),
            ),
          )
        ],
      ),
      body: Consumer<ToolsViewModel>(builder: (context, data, child) {
    return Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimationLimiter(
                child:ListView.builder(
                    itemCount: provider.rosaryItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return AnimationConfiguration.staggeredGrid(
                          duration:const Duration(milliseconds: 900),
                          position: index,
                          columnCount: 1,
                          child: ScaleAnimation(
                              duration:const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(child:InkWell(onTap: (){
                                push(RosaryChildPage());
                              },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 10.w),
                                  margin: EdgeInsets.symmetric(vertical: 5.w),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: Colors.grey.shade50),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(Assets.remembrances,width: 32.w,height: 32.h,),
                                      SizedBox(width: 5.w,),
                                      SizedBox(width: MediaQuery.of(context).size.width-100,
                                        child: Text(provider.rosaryItems[index],
                                          style: TextStyles()
                                              .getTitleStyle(fontSize: 14.sp)
                                              .customColor(AppColors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              )));
                    }),
              ),
            ),
            InkWell(onTap: (){
              showFollowTeamSheet(context);
            },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 10.w),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.grey.shade100, Colors.grey],
                    ),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10.w,),
                    Text(LocaleKeys.addNewRosary.tr(),
                      style: TextStyles()
                          .getDisplayMediumStyle(fontSize: 14.sp)
                          .customColor(AppColors.black),
                    ),
                  ],),),
            )
          ],
        ),
      );}) ,
    );
  }
  Future<dynamic> showFollowTeamSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SafeArea(child: AddRosarySheet()),
    );
  }
}

