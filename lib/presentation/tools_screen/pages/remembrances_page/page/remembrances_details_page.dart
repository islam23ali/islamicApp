import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_loader.dart';
import '../../../../../core/res/text_styles.dart';

class RemembrancesDetailsPage extends StatefulWidget {
  const RemembrancesDetailsPage({Key? key, required this.remembranceId, required this.name}) : super(key: key);
   final String? remembranceId;
   final String? name;

  @override
  _RemembrancesDetailsPageState createState() => _RemembrancesDetailsPageState();
}

class _RemembrancesDetailsPageState extends State<RemembrancesDetailsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ToolsViewModel>(context,listen: false).getAllRemembranceDetailsAPI(context, widget.remembranceId??'');
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      topColor: AppColors.primaryColor,
      topColorIcon: Brightness.light,
      titleColor: AppColors.white,
      color: AppColors.primaryColor,title: widget.name??'',isBackButtonExist: false,
      actions: [InkWell(onTap: (){
        Navigator.pop(context);
      },
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal:16.w),
        child: Icon(Icons.keyboard_arrow_left_rounded,color: AppColors.white,size: 26.r,),
    ),
      )],),
      body: Consumer<ToolsViewModel>(builder: (context, data, child) {
    return data.isLoading?AppLoader():  Padding(
        padding: EdgeInsets.all(12.r),
        child: (data.remembranceDetailsModel?.data?.length==0)?NoDataScreen(): AnimationLimiter(
          child:ListView.builder(
              itemCount: data.remembranceDetailsModel?.data?.length,
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
                            Container(width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                              margin: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 20.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r),border: Border.all(width: 1.w,color: AppColors.primaryColor),color: Colors.blue.shade50),
                              child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data.remembranceDetailsModel?.data?[index].text??'',
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
                                data.remembranceDetailsModel?.data?[index].title??'',
                                style: TextStyles()
                                    .getRegularStyle(fontSize: 16.sp)
                                    .customColor(AppColors.white),
                              ) ,))
                          ],
                        )
                        )));
              }),
        ),
      );}) ,);
  }
}
