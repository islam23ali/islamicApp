
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'app.dart';
import 'providers.dart';
import 'injection.dart' as injection;
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await injection.init();
  ///
  // await Firebase.initializeApp();
  // FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
  // await firebaseMessagingService.initializeFirebaseMessaging();
  // String? token = await firebaseMessagingService.getToken();
  // print('Firebase token: $token');

  ///
  runApp(
       GenerateMultiProvider(
         child:
        EasyLocalization(
          supportedLocales: supportedLocales,
          path: 'assets/strings',
          // if device language not supported
          fallbackLocale: supportedLocales[0],
          saveLocale: true,
          useOnlyLangCode: true,
          startLocale: supportedLocales[0],
          child:  MyApp(),
         ),
      )
  );
}
final supportedLocales = <Locale>[
  const Locale('ar'),
  const Locale('en'),
  // const Locale('tr'),
];