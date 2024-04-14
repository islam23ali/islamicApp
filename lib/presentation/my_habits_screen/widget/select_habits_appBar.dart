import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../../injection.dart';
import '../../component/svg_icon.dart';
import '../my_habits_screen_view_model.dart';
HabitsScreenViewModel provider =getIt();
class SelectHabitsAppBar extends StatefulWidget {
  const SelectHabitsAppBar({Key? key}) : super(key: key);

  @override
  _SelectHabitsAppBarState createState() => _SelectHabitsAppBarState();
}

class _SelectHabitsAppBarState extends State<SelectHabitsAppBar> {

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),//DateFormat(provider.startDateController.text??'')
      // firstDate: (isStart)? DateTime.now():DateTime.,
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(titleLarge: TextStyles().getTitleStyle(),titleMedium: TextStyles().getDisplayMediumStyle(),titleSmall: TextStyles().getRegularStyle(),
                labelLarge: TextStyles().getTitleStyle(),labelMedium: TextStyles().getDisplayMediumStyle(),labelSmall: TextStyles().getRegularStyle(),
                bodyLarge: TextStyles().getTitleStyle(),bodySmall: TextStyles().getRegularStyle(),displayLarge: TextStyles().getTitleStyle(),displayMedium: TextStyles().getDisplayMediumStyle(),
                displaySmall: TextStyles().getRegularStyle(),headlineLarge: TextStyles().getTitleStyle(),
                headlineMedium: TextStyles().getDisplayMediumStyle(),headlineSmall: TextStyles().getRegularStyle()
            ),
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );},
    );

    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd', 'en');
      final String formattedDate = formatter.format(picked);

      setState(() {
        provider.dateHabitsController.text = formattedDate;
        provider.getAllHabitsAPI(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      height: 90.h,
      child:Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
              // width: 75.h,
              child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(onTap:(){
                        _selectDate(context);
                      },
                        child: SizedBox(width: 40.w,
                          child: Column(
                            children: [
                              SVGIcon(Assets.expandLess,width: 24.w,height: 20.h,color: AppColors.white),
                              SVGIcon(Assets.expandMore,width: 24.w,height: 20.h,color: AppColors.white,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    provider.dateHabitsController.text==''?LocaleKeys.today.tr():provider.dateHabitsController.text,
                    style: TextStyles()
                        .getDisplayMediumStyle(fontSize: 14.sp)
                        .customColor(AppColors.white),
                  ),
                  SizedBox(width:provider.dateHabitsController.text==''? 30.w:0,),
                ],)),
          SizedBox(width: 45.w,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            height: 61.h,width: 40.w,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  LocaleKeys.yes.tr(),
                  style: TextStyles()
                      .getDisplayMediumStyle(fontSize: 10.sp)
                      .customColor(AppColors.white),
                ),
                Image.asset(Assets.yes,width: 32.w,height: 32.h,)
                // AppNetworkImage(imageUrl:Assets.selectedRegister,width: 40.w,height: 40.h,borderRadius: 4.r,),
              ],),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            height: 61.h,width: 40.w,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  LocaleKeys.no.tr(),
                  style: TextStyles()
                      .getDisplayMediumStyle(fontSize: 10.sp)
                      .customColor(AppColors.white),
                ),
                Image.asset(Assets.no,width: 32.w,height: 32.h,)
                // AppNetworkImage(imageUrl:Assets.selectedRegister,width: 40.w,height: 40.h,borderRadius: 4.r,),
              ],),)
        ],
      ) ,);
  }
}
