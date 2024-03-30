import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/presentation/reports_screen/reports_screen_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';

class ReportsCard extends StatefulWidget {
  const ReportsCard({Key? key}) : super(key: key);

  @override
  _ReportsCardState createState() => _ReportsCardState();
}

class _ReportsCardState extends State<ReportsCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReportsScreenViewModel>(builder: (context, data, child) {
      return  Column(
        children: [
          Card(
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
                Text(LocaleKeys.goodWorkReport.tr(),
                  style: TextStyles().getTitleStyle(fontSize: 18.sp).
                  customColor(AppColors.black),),
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
                                  spots: data.reportsModel?.data?.goodDeedAnalysis?.asMap().entries.map((data) {
                                    return
                                      FlSpot(data.key.toDouble(), data.value.percentage?.toDouble()??0.0);
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
                      SizedBox(height: 60.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // physics: const NeverScrollableScrollPhysics(),
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: data.reportsModel?.data?.goodDeedAnalysis?.length,
                            itemBuilder: (context,index){
                              return Center(
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 0.w),
                                  child:((data.reportsModel?.data?.goodDeedAnalysis?.length??0)>5)?Transform.rotate(
                                  angle: 90 * pi / 180,
                                      child: Text(data.reportsModel?.data?.goodDeedAnalysis?[index].title??'',
                                    style: TextStyles().getDescriptionStyle(fontSize: 8.sp).
                                    customColor(AppColors.black),)):Text(data.reportsModel?.data?.goodDeedAnalysis?[index].title??'',
                                    style: TextStyles().getDescriptionStyle(fontSize: 10.sp).
                                    customColor(AppColors.black),),
                                ),
                              );
                            },))
                    ],
                  ),
                ),
              ],
            ),
          ),
    ),
          Card(
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
                  Text(LocaleKeys.assumptionsReport.tr(),
                    style: TextStyles().getTitleStyle(fontSize: 18.sp).
                    customColor(AppColors.black),),
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
                                    spots: data.reportsModel?.data?.assumptionAnalysis?.asMap().entries.map((data) {
                                      return
                                        FlSpot(data.key.toDouble(), data.value.percentage?.toDouble()??0.0);
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
                        SizedBox(height: 60.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              reverse: true,
                              shrinkWrap: true,
                              itemCount: data.reportsModel?.data?.assumptionAnalysis?.length,
                              itemBuilder: (context,index){
                                return Center(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal:((data.reportsModel?.data?.assumptionAnalysis?.length??0)>5)? 0:20.w),
                                    child:((data.reportsModel?.data?.assumptionAnalysis?.length??0)>5)?Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: Text(data.reportsModel?.data?.assumptionAnalysis?[index].title??'',
                                          style: TextStyles().getDescriptionStyle(fontSize: 8.sp).
                                          customColor(AppColors.black),)):Text(data.reportsModel?.data?.assumptionAnalysis?[index].title??'',
                                      style: TextStyles().getDescriptionStyle(fontSize: 10.sp).
                                      customColor(AppColors.black),),
                                  ),
                                );
                              },))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
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
                  Text(LocaleKeys.sunnaReport.tr(),
                    style: TextStyles().getTitleStyle(fontSize: 18.sp).
                    customColor(AppColors.black),),
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
                                    spots: data.reportsModel?.data?.sunnahAnalysis?.asMap().entries.map((data) {
                                      return
                                        FlSpot(data.key.toDouble(), data.value.percentage?.toDouble()??0.0);
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
                        SizedBox(height: 60.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              reverse: true,
                              shrinkWrap: true,
                              itemCount: data.reportsModel?.data?.sunnahAnalysis?.length,
                              itemBuilder: (context,index){
                                return Center(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal:((data.reportsModel?.data?.sunnahAnalysis?.length??0)>5)?0: 20.w),
                                    child:((data.reportsModel?.data?.sunnahAnalysis?.length??0)>5)?Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: Text(data.reportsModel?.data?.sunnahAnalysis?[index].title??'',
                                          style: TextStyles().getDescriptionStyle(fontSize: 8.sp).
                                          customColor(AppColors.black),)):Text(data.reportsModel?.data?.sunnahAnalysis?[index].title??'',
                                      style: TextStyles().getDescriptionStyle(fontSize: 10.sp).
                                      customColor(AppColors.black),),
                                  ),
                                );
                              },))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );});
  }
}
