import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/res/text_styles.dart';
import 'package:islamic_app/core/resources/locale_keys.g.dart';
import 'package:islamic_app/presentation/component/component.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../component/svg_icon.dart';
import '../home_screen/home_screen.dart';
import '../my_habits_screen/my_habits_screen.dart';
import '../register_screen/register_screen.dart';
import '../reports_screen/reports_screen.dart';
import '../tools_screen/tools_screen.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarApp> createState() =>
      _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    RegisterScreen(),
    MyHabitsScreen(),
    ReportsScreen(),
    ToolsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 77.83.h,
        child: BottomNavigationBar(
          fixedColor: AppColors.second,
          selectedLabelStyle: TextStyles()
              .getTitleStyle(fontSize: 12.sp)
              .customColor(AppColors.white),
          unselectedLabelStyle: TextStyles()
              .getTitleStyle(fontSize: 8.sp)
              .customColor(AppColors.white),
          backgroundColor: AppColors.primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const SVGIcon(Assets.homeUnselect, color: AppColors.white),
              activeIcon: const SVGIcon(Assets.homeSelect),
              label: LocaleKeys.home.tr(),
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const SVGIcon(Assets.unselectedRegister),
              activeIcon: const SVGIcon(Assets.selectedRegister),
              label: LocaleKeys.register.tr(),
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const SVGIcon(Assets.myHabitsUnSelect),
              activeIcon: const SVGIcon(Assets.myHabitsSelect),
              label: LocaleKeys.myHabits.tr(),
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const SVGIcon(Assets.unSelectReport),
              activeIcon: const SVGIcon(Assets.selectReport),
              label: LocaleKeys.theReports.tr(),
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const SVGIcon(Assets.unSelectTools),
              activeIcon: const SVGIcon(Assets.selectTools),
              label: LocaleKeys.tools.tr(),
              backgroundColor: AppColors.primaryColor,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}