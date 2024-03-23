import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/core/routing/route.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/tools_screen/pages/remembrances_page/page/remembrances_details_page.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_loader.dart';
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
  void initState() {
    super.initState();
    Provider.of<ToolsViewModel>(context,listen: false).getAllRemembranceAPI(context);
  }
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
      body: Consumer<ToolsViewModel>(builder: (context, data, child) {
    return data.isLoading?AppLoader(): Padding(
        padding: EdgeInsets.all(12.r),
        child: (data.remembranceModel?.data?.length==0)?NoDataScreen(): AnimationLimiter(
          child:ListView.builder(
              itemCount: data.remembranceModel?.data?.length,
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
                        InkWell(onTap: (){
                          push(RemembrancesDetailsPage(remembranceId: data.remembranceModel?.data?[index].id.toString()??'',
                            name: data.remembranceModel?.data?[index].title??'',));
                        },
                          child: Container(height: 50.h,
                            margin: EdgeInsets.symmetric(vertical: 2.h),
                            padding: EdgeInsets.symmetric(horizontal: 5.h),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),color: AppColors.ofWhite,),
                            child: Center(
                              child: Row(
                                children: [
                                  AppNetworkImage(imageUrl:data.remembranceModel?.data?[index].image??'',width: 32.w,height: 32.h,borderRadius: 4.r,),
                                  SizedBox(width: 5.w,),
                                  SizedBox(width: 100.w,
                                    child: Text(data.remembranceModel?.data?[index].title??'',
                                      style: TextStyles()
                                          .getTitleStyle(fontSize: 14.sp)
                                          .customColor(AppColors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        )));
              }),
        ),
      );}) ,);
  }
}
