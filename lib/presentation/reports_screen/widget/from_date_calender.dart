import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/injection.dart';
import 'package:islamic_app/presentation/component/inputs/new/customTextFormField.dart';
import 'package:islamic_app/presentation/component/svg_icon.dart';
import 'package:islamic_app/presentation/reports_screen/reports_screen_view_model.dart';
import 'package:jhijri/_src/_jHijri.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/locale_keys.g.dart';
ReportsScreenViewModel provider =getIt();
class FromDateCalender extends StatefulWidget {
  const FromDateCalender({Key? key}) : super(key: key);

  @override
  _FromDateCalenderState createState() => _FromDateCalenderState();
}

class _FromDateCalenderState extends State<FromDateCalender> {
  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate2 = DateTime.now();
  final jHijriNow = JHijri.now();



  bool showDate = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.from.tr(),
              style: TextStyles()
                  .getDisplayMediumStyle(fontSize: 14.sp)
                  .customColor(AppColors.black),
            ),
            SizedBox(height: 5.h,),
            (showDate==true)? SizedBox(): CustomTextFormFiled(
              onTap: (){
                setState(() {
                  showDate=!showDate;
                });
              },
              readOnly: true,
              controller: provider.fromDateController,
              image: Assets.expandMore,
              imageColor: AppColors.black,
              imageHeight: 16.h,
              imageWidth: 16.w,
              paddingHorizontal: 10.w,
              hintText: jHijriNow.hijri.toString(),
              borderColor: AppColors.grayLight,
              borderWidth: 3.w,
            )
          ],),
        (showDate!=true)? SizedBox():
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),color: Colors.transparent,
            border: Border.all(width: 3.w,color: AppColors.grayLight)),
          child: Column(
            children: [
              InkWell(onTap: (){
                setState(() {
                  showDate=!showDate;
                });
              },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(provider.fromDateController.text==''?jHijriNow.hijri.toString():provider.fromDateController.text,style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .customColor(AppColors.black),),
                      SVGIcon(Assets.expandLess,width: 16.w,height: 16.h,color: AppColors.black,)
                  ],),
                ),
              ),
              SizedBox(height: 320.h,
                  child:CalendarCarousel<Event>(
                    rightButtonIcon : Icon(Icons.keyboard_arrow_left_rounded),
                    leftButtonIcon: Icon(Icons.keyboard_arrow_right_rounded),
                    inactiveWeekendTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 16.sp)
                        .customColor(AppColors.gray),
                    markedDateMoreCustomTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 16.sp)
                        .customColor(AppColors.white),
                    shouldShowTransform: true,
                    childAspectRatio: 1.5,
                    weekdayTextStyle: TextStyles()
                        .getRegularStyle(fontSize: 10.sp)
                        .customColor(AppColors.gray),
                    showWeekDays: true,
                    locale: 'ar',
                    headerTitleTouchable: true,
                    headerTextStyle: TextStyles()
                        .getTitleStyle(fontSize:16.sp)
                        .customColor(AppColors.black),
                    todayBorderColor: AppColors.primaryColor,
                    onDayPressed: (date, events) {
                      setState(() {
                        _selectedDate2 = date;
                        String formattedDate = DateFormat('yyyy-MM-dd','en').format(_selectedDate2);
                        print('hhhhhhhh...${formattedDate}');
                        print('hhhhhhhh...${_selectedDate2}');
                        provider.fromDateApiController.text = formattedDate;
                        final jHijri = JHijri(fDate: _selectedDate2).hijri;
                        provider.fromDateController.text=jHijri.toString();
                        showDate=!showDate;
                      });
                      events.forEach((event) => print(event.title));
                    },
                    showOnlyCurrentMonthDate: false,
                    weekendTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                    thisMonthDayBorderColor: Colors.grey,
                    weekFormat: false,
//      firstDayOfWeek: 4,
//                     markedDatesMap: _markedDateMap,
//                     height: 400.0,
                    selectedDateTime: _selectedDate2,
                    // targetDateTime: _targetDateTime,
                    customGridViewPhysics: NeverScrollableScrollPhysics(),
                    markedDateCustomShapeBorder:
                    CircleBorder(side: BorderSide(color: AppColors.second)),
                    markedDateCustomTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 18.sp)
                        .customColor(AppColors.white),
                    showHeader: true,
                    todayTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 18.sp)
                        .customColor(AppColors.black),
                    markedDateShowIcon: true,
                    markedDateIconMaxShown: 2,
                    // markedDateIconBuilder: (event) {
                    //   return event.icon;
                    // },
                    markedDateMoreShowTotal:true,
                    todayButtonColor: AppColors.primaryColor,
                    selectedDayTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 14.sp)
                        .customColor(AppColors.white),
                    // minSelectedDate: hhh.dateTime,
                    minSelectedDate: _currentDate.subtract(Duration(days: 360)),
                    // maxSelectedDate: hhh.dateTime,
                    maxSelectedDate: _currentDate.add(Duration(days: 360)),
                    prevDaysTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 16.sp)
                        .customColor(AppColors.gray),
                    inactiveDaysTextStyle: TextStyles()
                        .getDisplayMediumStyle(fontSize: 16.sp)
                        .customColor(AppColors.gray),
                    onCalendarChanged: (DateTime date) {
                      this.setState(() {
                        // _targetDateTime = date;
                        // _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                    onDayLongPressed: (DateTime date) {
                      print('long pressed date $date');
                    },
                  )
              ),
            ],
          ),),
      ],
    );
  }
}