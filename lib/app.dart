import 'package:country_code_picker/country_localizations.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';
import 'package:islamic_app/presentation/splash/splash.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/widget/sura_details/sura_details.dart';
import 'core/res/theme/theme_manager.dart';
import 'main.dart';
BuildContext? appContext;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return MaterialApp(
      routes: {
        suraDetails.routename : (context) => suraDetails(),
      },
      color:Theme.of(context).scaffoldBackgroundColor,
      localizationsDelegates: [
        CountryLocalizations.delegate, ...context.localizationDelegates,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // locale: supportedLocales[0],
      title: 'حاسبوا أنفسكم',
       theme: getAppTheme(),

     // theme: lightTheme,     ///ده سبب مشكله الريليز
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      home: const Splash(),
    );
  }
}

