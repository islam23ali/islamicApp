import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';

class TopCardHome extends StatefulWidget {
  const TopCardHome({Key? key}) : super(key: key);

  @override
  _TopCardHomeState createState() => _TopCardHomeState();
}

class _TopCardHomeState extends State<TopCardHome> {
  final List<EconomicData> economicData = [
    EconomicData('2021', -5.9),
    EconomicData('2022', -8.9),
    EconomicData('2023', 8.9),
    EconomicData('2024', 7.9),
    EconomicData('2025', -1.9),
    EconomicData('2026', 1.9),
    EconomicData('2027', -2.9),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.w, color: AppColors.grayLight),
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الموجز',
                  style: TextStyles()
                      .getTitleStyle(fontSize: 18.sp)
                      .customColor(AppColors.primaryColor),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.h, horizontal: 10.w),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29.r),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.day.tr(),
                          style: TextStyles()
                              .getRegularStyle(fontSize: 12.sp)
                              .customColor(AppColors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.h, horizontal: 10.w),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29.r),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.week.tr(),
                          style: TextStyles()
                              .getRegularStyle(fontSize: 12.sp)
                              .customColor(AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 180.h,
              child: LineChart(
                LineChartData(
                  baselineX: 100,
                  baselineY: 100,

                  lineTouchData: LineTouchData(enabled: true,),
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: economicData
                          .asMap()
                          .entries
                          .map((entry) =>
                          FlSpot(entry.key.toDouble(), entry.value.gdp))
                          .toList(),
                      isCurved: true,
                      color: AppColors.primaryColor,
                      barWidth: 2.w,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class EconomicData {
  final String year;
  final double gdp;

  EconomicData(this.year, this.gdp);
}