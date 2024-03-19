import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/component/animation/column_animator.dart';
import 'package:islamic_app/presentation/component/buttons/custom_button.dart';
import 'package:islamic_app/presentation/reports_screen/widget/from_date_calender.dart';
import 'package:islamic_app/presentation/reports_screen/widget/to_date_calender.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../home_screen/widget/top_card_home.dart';
import '../register_screen/widget/top_appbar.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

  final TextEditingController fromDateController = TextEditingController();

bool showReport= false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopAppBar(logo: Assets.reportsLogo, title: 'اهلا بك في صفحة التقارير',
                label: 'تمكنك هذه الصفحة من عرض تقاريرك في المدة التي تختارها',
                date: 'الأربعاء 25 شعبان 1445',),
              SizedBox(height: 30.h,)
          ],),
        ),
        Expanded(child:
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: ColumnAnimator(
            children: [
              FromDateCalender(),
              ToDateCalender(),
              CustomButton(onTap: (){
                setState(() {
                  showReport=!showReport;
                });
              },title:(showReport==true)?LocaleKeys.hideReports.tr(): LocaleKeys.showReport.tr(),),
              (showReport==true)? TopCardHome():SizedBox(),
          ],),
        ))
      ],
    ));
  }
}

