import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/num_extensions.dart';
import 'package:islamic_app/core/resources/app_assets.dart';
import 'package:islamic_app/core/routing/route.dart';
import 'package:islamic_app/presentation/component/component.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/widget/sura_details/sura_details.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/widget/sura_model.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';


class quranTap extends StatelessWidget {
  static const String routename = "quranTap";
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  quranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        topColor: AppColors.primaryColor,
        topColorIcon: Brightness.light,
        titleColor: AppColors.white,
        color: AppColors.primaryColor,
        title: LocaleKeys.quraan.tr(),
        isBackButtonExist: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: AppColors.white,
                size: 26.r,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(Assets.quraan,
            width: 205,
            height: 227,
          ),
         const Divider(),
          Center(
            child: Text(LocaleKeys.chooseAppColor.tr(),
              style: TextStyles()
                  .getTitleStyle(fontSize: 16.sp)
                  .customColor(AppColors.black),
            ),
          ),
         const Divider(),
          Expanded(
              child: ListView.separated(
                itemCount: suraNames.length,
                separatorBuilder: (context, index) =>const Divider(
                  // thickness: 2,
                  // color: Color(0XFFB7935F),
                  // endIndent: 40,
                  // indent: 40,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        suraDetails.routename,
                        arguments: SuraModel(index: index, name: suraNames[index]),
                      );
                      // push(suraDetails());
                    },
                    child: Text(
                        suraNames[index],
                        textAlign: TextAlign.center,
                        style: TextStyles().getTitleStyle(fontSize: 18.sp).customColor(AppColors.black)
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
