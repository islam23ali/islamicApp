import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../component/svg_icon.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({Key? key, required this.logo, required this.title, required this.label, required this.date}) : super(key: key);
  final String? logo;
  final String? title;
  final String? label;
  final String? date;

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
                  widget.date??'',
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
            Image.asset(widget.logo??'',width: 80.w,height:80.h),
            SizedBox(width: 10.w,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title??'',
                  style: TextStyles()
                      .getTitleStyle(fontSize: 14.sp)
                      .customColor(AppColors.white),
                ),SizedBox(height: 5.w,),
                Text(
                  widget.label??'',
                  style: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(AppColors.white),
                ),
              ],),
          ],),),
      ],);
  }
}
