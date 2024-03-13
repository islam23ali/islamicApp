import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../component/svg_icon.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          height: 50.h,
          child: Center(
            child: Row(
              children: [
                Text(
                  'الأربعاء 25 شعبان 1445',
                  style: TextStyles()
                      .getTitleStyle(fontSize: 16.sp)
                      .customColor(AppColors.white),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          height: 80.h,
          child: Row(children: [
            Image.asset(Assets.praying,width: 80.w,height:80.h),
            SizedBox(width: 10.w,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'انتبه! لم تصلي الفجر بعد',
                  style: TextStyles()
                      .getTitleStyle(fontSize: 14.sp)
                      .customColor(AppColors.white),
                ),SizedBox(height: 5.w,),
                Text(
                  'الصلاة القادمة: الظهر 3 ساعات و4دقائق',
                  style: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(AppColors.white),
                ),
              ],),
          ],),),
      ],);
  }
}
