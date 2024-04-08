import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:islamic_app/core/app_loader.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/res/text_styles.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/home_screen/home_view_model.dart';
import 'package:islamic_app/presentation/home_screen/widget/bottom_card.dart';
import 'package:islamic_app/presentation/home_screen/widget/color_card.dart';
import 'package:islamic_app/presentation/home_screen/widget/top_card_home.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../component/custom_circle_pant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context,listen: false).percentageAPI(context);
    Provider.of<HomeViewModel>(context,listen: false).analysisAPI(context);
  }
  @override
  Widget build(BuildContext context) {
    final jHijriNow = JHijri.now();
    final load =context.watch<HomeViewModel>().isLoading;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: load?AppLoader(): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              color: AppColors.white,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      jHijriNow.hijri.toString(),
                      style: TextStyles()
                          .getTitleStyle(fontSize: 16.sp)
                          .customColor(AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
            const ColorCard(),
             TopCardHome(gradientColor1: AppColors.primaryColor,),
            const BottomCard(),
          ],
        ),
      ),
    );
  }
}