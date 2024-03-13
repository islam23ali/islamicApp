import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/res/text_styles.dart';
import 'package:islamic_app/core/resources/app_colors.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/home_screen/widget/color_card.dart';
import 'package:islamic_app/presentation/home_screen/widget/top_card_home.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              color: AppColors.white,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'الأربعاء 25 شعبان 1445',
                      style: TextStyles()
                          .getTitleStyle(fontSize: 16.sp)
                          .customColor(AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
            const ColorCard(),
            const TopCardHome(),
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
                    SizedBox(height: 80.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomPaint(
                          size: const Size(100, 100), // no effect while adding child
                          painter: CircularPaint(
                            progressValue: .5, //[0-1]
                          ),
                          child: Card(
                            margin: EdgeInsets.all(6.r),
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: AppColors.grayLight),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            elevation: 3,
                            child: Container(
                              height:92.h,width: 92.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                              child: Center(child: Text('%50',style: TextStyles().getTitleStyle(fontSize: 24.sp).customColor(AppColors.black),)),),
                          ),
                        ),
                          SizedBox(height: 20.h,),
                          Text('صلاة الفرض',style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                      ],),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomPaint(
                          // size: const Size(100, 100), // no effect while adding child
                          painter: CircularPaint(
                            progressValue: .5, //[0-1]
                          ),
                          child: Card(
                            margin: EdgeInsets.all(6.r),
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: AppColors.grayLight),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            elevation: 3,
                            child: Container(
                              height:92.h,width: 92.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                              child: Center(child: Text('%50',style: TextStyles().getTitleStyle(fontSize: 24.sp).customColor(AppColors.black),)),),
                          ),
                        ),
                          SizedBox(height: 20.h,),
                          Text('صلاة الفرض',style: TextStyles().getTitleStyle(fontSize: 15.sp).customColor(AppColors.black))
                      ],),
                    ],)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
double deg2rad(double deg) => deg * math.pi / 180;
class CircularPaint extends CustomPainter {
  /// ring/border thickness, default  it will be 8px [borderThickness].
  final double borderThickness;
  final double progressValue;

  CircularPaint({
    this.borderThickness = 6.0,
    required this.progressValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect =
    Rect.fromCenter(center: center, width: size.width, height: size.height);

    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness;

    //grey background
    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );

    Paint progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.purple,
          Colors.orange,
          Colors.green,
          Colors.deepOrange,
        ],
      ).createShader(rect);
    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}