import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/locale_keys.g.dart';
import '../../core/routing/route.dart';
import 'svg_icon.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key, required this.userName});
  final String? userName;

  @override
  State<AppBarHome> createState() => _AppBarHomeStoreState();
}

class _AppBarHomeStoreState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SVGIcon(Assets.homeUnselect,width: 40.w,height: 40.h,),
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LocaleKeys.hello.tr()',
                  style: TextStyles()
                      .getRegularStyle(fontSize: 12.sp)
                      .customColor(AppColors.gray),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: Text(widget.userName??'',
                    style: TextStyles().getRegularStyle(fontSize: 14.sp,).customColor(AppColors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  // push(Notifications());
                  },
                child: Stack(children: <Widget>[
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: SVGIcon(
                      Assets.homeUnselect,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(100.r),
                            border: Border.all(
                                width: .8.w,
                                color: AppColors.grayLight),
                            color: AppColors.primaryColor
                        ),
                        child: Center(
                          child: Text('12',
                            style: TextStyles()
                                .getTitleStyle(fontSize: 9.sp)
                                .customColor(AppColors.white),
                          ),
                        ),))
                ])),
            InkWell(
                onTap: () {
                  // push(MyProfile());
                  },
                child: Stack(children: <Widget>[
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: SVGIcon(
                      Assets.homeSelect,
                      height: 24.h,
                      width: 24.w,
                    ),
                  )
                ])),
          ],
        ),
      ],
    );
  }
}
