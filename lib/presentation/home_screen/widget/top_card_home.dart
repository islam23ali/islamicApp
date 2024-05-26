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
  const TopCardHome({Key? key, Color? gradientColor1}) : gradientColor1 = gradientColor1 ?? Colors.blue;
final Color gradientColor1;
  @override
  _TopCardHomeState createState() => _TopCardHomeState();
}

class _TopCardHomeState extends State<TopCardHome> {
  int isDayAnalysis=1;

  List<int> showingTooltipOnSpots = [0,1,2,3,4];

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    // final style = TextStyle(
    //   fontWeight: FontWeight.bold,
    //   color: Colors.black45,
    //   fontFamily: 'Digital',
    //   fontSize: 18 * chartWidth / 500,
    // );
    final style =TextStyles().getTitleStyle(fontSize: 12.sp).customColor(AppColors.black);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'فجر';
        break;
      case 1:
        text = 'ظهر';
        break;
      case 2:
        text = 'عصر';
        break;
      case 3:
        text = 'مغرب';
        break;
      case 4:
        text = 'عشاء';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, data, child) {

      final lineBarsData = [
        LineChartBarData(
          showingIndicators: showingTooltipOnSpots,
          spots:data.analysisModel?.data?.asMap().entries.map((data) {
            return
              (isDayAnalysis==1)? FlSpot(data.key.toDouble(), data.value.allAssumptionPercentage.toDouble()??0.0):
            (isDayAnalysis==2)? FlSpot(data.key.toDouble(), data.value.dayAssumptionPercentage.toDouble()??0.0):
            FlSpot(data.key.toDouble(), data.value.weekAssumptionPercentage.toDouble()??0.0);
          // }).toList()??[],
          }).toList().reversed.toList()??[],
          isCurved: true,
          barWidth: 2.w,
          shadow: const Shadow(
            blurRadius: 0,
          ),
          belowBarData: BarAreaData(
              cutOffY: -14.0,
              applyCutOffY:true,
              show: true,
              // gradient: LinearGradient(
              //   colors: [
              //     widget.gradientColor1.withOpacity(0.4),
              //     widget.gradientColor2.withOpacity(0.4),
              //     widget.gradientColor3.withOpacity(0.4),
              //   ],
              // ),
              color: widget.gradientColor1.withOpacity(0.1)
          ),
          dotData: const FlDotData(show: true),

          gradient: LinearGradient(
            colors: [
              widget.gradientColor1,
              widget.gradientColor1,
              widget.gradientColor1,
            ],
            stops: const [0.1, 0.4, 0.9],
          ),
        ),
      ];

      final tooltipsOnBar = lineBarsData[0];

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
            SizedBox(height: 30.h,),
            SizedBox(
              height: 180.h,
              child: AspectRatio(
                aspectRatio: 2.5,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return LineChart(
                      LineChartData(
                        showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                          return //showingTooltipOnSpots.isEmpty? const SizedBox():
                            ShowingTooltipIndicators([
                            LineBarSpot(
                              tooltipsOnBar,
                              lineBarsData.indexOf(tooltipsOnBar),
                           //  tooltipsOnBar.spots[index],
                             tooltipsOnBar.spots.isEmpty ? const FlSpot(0.0,0.0):tooltipsOnBar.spots[index],
                            ),
                          ]);
                        }).toList(),
                        lineTouchData: LineTouchData(
                          enabled: true,
                          handleBuiltInTouches: false,
                          touchCallback:
                              (FlTouchEvent event, LineTouchResponse? response) {

                            if (response == null || response.lineBarSpots == null) {
                              return;
                            }
                            // if (event is FlTapUpEvent) {
                            //   final spotIndex = response.lineBarSpots!.first.spotIndex;
                            //   setState(() {
                            //     if (showingTooltipOnSpots.contains(spotIndex)) {
                            //       showingTooltipOnSpots.remove(spotIndex);
                            //     } else {
                            //       showingTooltipOnSpots.add(spotIndex);
                            //     }
                            //   });
                            // }
                          },
                          mouseCursorResolver:
                              (FlTouchEvent event, LineTouchResponse? response) {
                            if (response == null || response.lineBarSpots == null) {
                              return SystemMouseCursors.basic;
                            }
                            return SystemMouseCursors.click;
                          },
                          getTouchedSpotIndicator:
                              (LineChartBarData barData, List<int> spotIndexes) {
                            return spotIndexes.map((index) {
                              return TouchedSpotIndicatorData(
                                 FlLine(strokeWidth: 1.5.w,
                                  color: AppColors.second,
                                ),
                                FlDotData(
                                  show: true,
                                  getDotPainter: (spot, percent, barData, index) =>
                                      FlDotCirclePainter(
                                        radius: 6.r,
                                        color: Colors.white,
                                        strokeWidth: 1.5.w,
                                        strokeColor: AppColors.second,
                                      ),
                                ),
                              );
                            }).toList();
                          },
                          touchTooltipData: LineTouchTooltipData(
                            // getTooltipColor: (touchedSpot) => Colors.pink,
                            tooltipRoundedRadius: 8,
                            tooltipBgColor: Colors.transparent,
                            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                              return lineBarsSpot.map((lineBarSpot) {
                                int numberAsInt = lineBarSpot.y.truncate();
                                return LineTooltipItem(
                                  "$numberAsInt%",
                                   TextStyles().getTitleStyle(fontSize: 14.sp).customColor(AppColors.black)
                                );
                              }).toList();
                            },
                          ),
                        ),
                        lineBarsData: lineBarsData,
                        minY: 0,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            // axisNameWidget: Text('count'),
                            axisNameWidget: Text(''),
                            axisNameSize: 20,
                            sideTitles: SideTitles(
                              showTitles: false,
                              reservedSize: 0,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                return bottomTitleWidgets(
                                  value,
                                  meta,
                                  constraints.maxWidth,
                                );
                              },
                              reservedSize: 30,
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            // axisNameWidget: Text('count'),
                            axisNameWidget: Text(''),
                            sideTitles: SideTitles(
                              showTitles: false,
                              reservedSize: 0,
                            ),
                          ),
                          topTitles: const AxisTitles(
                            axisNameWidget: Text('',
                              textAlign: TextAlign.left,
                            ),
                            axisNameSize: 24,
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 0,
                            ),
                          ),
                        ),
                        gridData: const FlGridData(show: true),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                            color:Colors.transparent,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            // ),
          ],
        ),
      ),
    );});
  }
}