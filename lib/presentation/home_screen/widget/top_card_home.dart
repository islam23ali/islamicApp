import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../home_view_model.dart';

class TopCardHome extends StatefulWidget {
  const TopCardHome({Key? key}) : super(key: key);

  @override
  _TopCardHomeState createState() => _TopCardHomeState();
}

class _TopCardHomeState extends State<TopCardHome> {
  int isDayAnalysis=1;
  // final List<EconomicData> economicData = [
  //   EconomicData('فجر', -5.9),
  //   EconomicData('ظهر', -8.9),
  //   EconomicData('عصر', 8.9),
  //   EconomicData('مغرب', 7.9),
  //   EconomicData('عشاء', -1.9),
  // ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, data, child) {
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
                  LocaleKeys.summary.tr(),
                  style: TextStyles()
                      .getTitleStyle(fontSize: 18.sp)
                      .customColor(AppColors.primaryColor),
                ),
                Row(
                  children: [
                    InkWell(onTap: (){
                      setState(() {
                        isDayAnalysis=1;
                      });
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color:(isDayAnalysis==1)? AppColors.primaryColor:Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.all.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor((isDayAnalysis==1)?AppColors.white:AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(onTap: (){
                      setState(() {
                        isDayAnalysis=2;
                      });
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color:(isDayAnalysis==2)? AppColors.primaryColor:Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.day.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor((isDayAnalysis==2)?AppColors.white:AppColors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(onTap: (){
                      setState(() {
                        isDayAnalysis=3;
                      });
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color:(isDayAnalysis==3)? AppColors.primaryColor:Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.week.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor((isDayAnalysis==3)?AppColors.white:AppColors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 180.h,
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:25.w,vertical: 20.h),
                      child: LineChart(
                        LineChartData(
                          baselineX: 100,
                          baselineY: 100,

                          lineTouchData: LineTouchData(enabled: true,),
                          gridData: FlGridData(show: true),
                          // titlesData: FlTitlesData(show: true),
                          titlesData:FlTitlesData(
                            // bottomTitles: ,
                              topTitles: AxisTitles(),leftTitles: AxisTitles(),rightTitles: AxisTitles(),bottomTitles: AxisTitles()) ,
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              // spots: economicData.asMap().entries.map((entry) =>
                              //     FlSpot(entry.key.toDouble(), entry.value.gdp,))
                              //     .toList(),
                              // spots: economicData.map((data) {
                              //   return FlSpot(economicData.indexOf(data).toDouble(), data.gdp);
                                spots: data.analysisModel?.data?.asMap().entries.map((data) {
                                return
                                  // FlSpot( data.dayAssumptionPercentage.toDouble(), // Replace this with your actual x value
                                  // data.daySunnahPercentage.toDouble(),);
                                  (isDayAnalysis==1)? FlSpot(data.key.toDouble(), data.value.allAssumptionPercentage.toDouble()??0.0):
                                  (isDayAnalysis==2)? FlSpot(data.key.toDouble(), data.value.dayAssumptionPercentage.toDouble()??0.0):
                                  FlSpot(data.key.toDouble(), data.value.weekAssumptionPercentage.toDouble()??0.0);
                              }).toList()??[],
                              isCurved: true,
                              color: AppColors.primaryColor,
                              barWidth: 2.w,
                              dotData: FlDotData(show: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: data.analysisModel?.data?.length,
                        itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(data.analysisModel?.data?[index].title??'',
                            style: TextStyles().getDescriptionStyle(fontSize: 10.sp).
                            customColor(AppColors.black),),
                        );
                        },))
                ],
              ),
            ),
          ],
        ),
      ),
    );});
  }
}
// class EconomicData {
//   final String year;
//   final double gdp;
//
//   EconomicData(this.year, this.gdp);
// }