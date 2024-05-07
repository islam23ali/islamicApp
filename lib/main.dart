import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:islamic_app/presentation/firebase_notification/FirebaseNotificationHandler.dart';
import 'package:islamic_app/presentation/tools_screen/azan_files/pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'providers.dart';
import 'injection.dart' as injection;


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
//   await Firebase.initializeApp();
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  HttpOverrides.global = MyHttpOverrides();

  await Prefs.init();
  await injection.init();
  ///
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
  // await firebaseMessagingService.initializeFirebaseMessaging();
  // String? token = await firebaseMessagingService.getToken();
  // print('Firebase token: $token');

  await initializeApp();
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

initializeApp() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}
Future<bool> onIosBackground(ServiceInstance serviceInstance) async {
  return true;
}
onStart(ServiceInstance service) async {

  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });



  Timer.periodic(const Duration(minutes: 1), (timer) async {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');
    // print("time now is ----${formatter.format(now)}");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('myList');
    if (jsonString != null) {
      List<String> myList = List<String>.from(jsonDecode(jsonString));

      for (int i = 0; i < myList.length; i++) {
        if(myList[i] == formatter.format(now)){
          // print(";;;;;6666666666;;;;;;${myList[i]}");
          // showNotification(flutterLocalNotificationsPlugin);
          final player = AudioPlayer();
          await player.setSource(AssetSource('audio/azan.mp3'));
          await player.play(AssetSource('audio/azan.mp3'));

        }else{
          // print(";;;;;77777;;;;;;${myList[i]}");
          // print(";;;;;time now;;;;;;${formatter.format(now)}");
        }
      }
    }
  });
}