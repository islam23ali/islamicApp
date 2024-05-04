import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/app_loader.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/routing/route.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/tools_screen/pages/hadiths_page/hadiths_page.dart';
import 'package:islamic_app/presentation/tools_screen/pages/imsakia_page/imsakiya_page.dart';
import 'package:islamic_app/presentation/tools_screen/pages/notification_page/notification_pagr.dart';
import 'package:islamic_app/presentation/tools_screen/pages/qibla_page/qiblah_screen.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/quraan_page.dart';
import 'package:islamic_app/presentation/tools_screen/pages/remembrances_page/remembrances_page.dart';
import 'package:islamic_app/presentation/tools_screen/pages/rosary_page/rosary_page.dart';
import 'package:islamic_app/presentation/tools_screen/pages/supplications_page/supplications_page.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:provider/provider.dart';
import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/locale_keys.g.dart';
import '../register_screen/widget/top_appbar.dart';
import '../reports_screen/reports_screen_view_model.dart';
import 'azan_files/home_screen.dart';
import 'new_quraan/new_quraan.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  _ToolsScreenState createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportsScreenViewModel>(context,listen: false).titlePageAPI(context,'tools');
  }
  @override
  Widget build(BuildContext context) {
    final load =context.watch<ReportsScreenViewModel>().isLoading;
    return SafeArea(child:
        Consumer<ReportsScreenViewModel>(builder: (context, data, child) {
      final jHijri = JHijri(fDate:data.titlePagesModel?.data?.date).hijri;
      return load?AppLoader(): Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TopAppBar(logo: Assets.toolsLogo, title: data.titlePagesModel?.data?.title??'',
            label: data.titlePagesModel?.data?.body??'',
            date: jHijri.toString(),),
          SizedBox(height: 30.h,)
      ],),),
      SizedBox(height: 20.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(onTap: (){
            push(HomeAzanScreen());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SVGIcon(Assets.azan,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.azan.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
          InkWell(onTap: (){
            push(HadithsPage());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.remembrances,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.hadiths.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
          InkWell(onTap: (){
            push(RemembrancesPage());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.remembrances,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.remembrances.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
          InkWell(onTap: (){
            push(SupplicationsPage());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.supplications,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.supplications.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 30.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          InkWell(onTap: (){
            push(Rosary());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.remembrances,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.rosary.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
          InkWell(onTap: (){
            push(QiblahScreen());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.qibla,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.qibla.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
          InkWell(onTap: (){
            push(ImsakiyaPage());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.imsakiya,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.imsakiya.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
          InkWell(onTap: (){
            push(NotificationPage());
          },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.notifications,height: 70.h,width: 70.w,),
                SizedBox(height: 10.h,),
                Text(LocaleKeys.notifications.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 30.h,),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //
      //
      //     InkWell(onTap: (){
      //       push(quranTap());
      //     },
      //       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Image.asset(Assets.quraan,height: 70.h,width: 70.w,),
      //           SizedBox(height: 10.h,),
      //           Text(LocaleKeys.quraan.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
      //         ],
      //       ),
      //     ),
      //
      //     // InkWell(onTap: (){
      //     //   push(QuranApp());
      //     // },
      //     //   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      //     //     children: [
      //     //       Image.asset(Assets.quraan,height: 70.h,width: 70.w,),
      //     //       SizedBox(height: 10.h,),
      //     //       Text(LocaleKeys.quraan.tr(),style: TextStyles().getDisplayMediumStyle(fontSize: 14.sp).customColor(AppColors.text1Color),)
      //     //     ],
      //     //   ),
      //     // ),
      //   ],
      // ),
    ],);}));
  }
}
