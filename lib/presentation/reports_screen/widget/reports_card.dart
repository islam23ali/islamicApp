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
import 'assumption_card.dart';
import 'aunna_card.dart';

class ReportsCard extends StatefulWidget {
  const ReportsCard({Key? key, Color? gradientColor1}) : gradientColor1 = gradientColor1 ?? Colors.blue;
  final Color gradientColor1;
  @override
  _ReportsCardState createState() => _ReportsCardState();
}

class _ReportsCardState extends State<ReportsCard> {

  List<int> showingTooltipOnSpots = [0,1,2,3,4,5,6,7,8];

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
        text = 'اذكار الصباح';
        break;
      case 1:
        text = 'اذكار المساء';
        break;
      case 2:
        text = 'قراءة القران';
        break;
      case 3:
        text = 'الصدقاء';
        break;
      case 4:
        text = 'زيارة المريض';
        break;
      case 5:
        text = 'صلة الرحم';
        break;
      case 6:
        text = 'قيام الليل';
        break;
      case 7:
        text = 'القراءة';
        break;
      case 8:
        text = 'ممارسة الرياضة';
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
    return Consumer<ReportsScreenViewModel>(builder: (context, data, child) {
      final lineBarsData = [
        LineChartBarData(
          showingIndicators: showingTooltipOnSpots,
          spots:data.reportsModel?.data?.goodDeedAnalysis?.asMap().entries.map((data) {
        return
          FlSpot(data.key.toDouble(), data.value.percentage?.toDouble()??0.0);
      }).toList()??[],
          // }).toList().reversed.toList()??[],
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h,),
                      SizedBox(
                        height: 180.h,
                        child: AspectRatio(
                          aspectRatio: 2.5,
                          child: LayoutBuilder(builder: (context, constraints) {
                            return LineChart(
                              LineChartData(
                                showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                                  return ShowingTooltipIndicators([
                                    LineBarSpot(
                                      tooltipsOnBar,
                                      lineBarsData.indexOf(tooltipsOnBar),
                                      tooltipsOnBar.spots[index],
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
                                        return Transform.rotate(
                                          angle: 60 * pi / 180,
                                          child: bottomTitleWidgets(
                                            value,
                                            meta,
                                            constraints.maxWidth,
                                          ),
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
                      SizedBox(height: 25.h,),
                    ],
                  ),
                )
              ],
            ),
          ),
    ),
          AssumptionCard(gradientColor1: AppColors.primaryColor,),
          SunnaCard(gradientColor1: AppColors.primaryColor,),
        ],
      );});
  }
}
