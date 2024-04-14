import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:islamic_app/presentation/tools_screen/pages/notification_page/notification_pagr.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../core/routing/route.dart';
import '../tools_screen/tools_view_model.dart';

class FirebaseMessagingService {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
  Future<void> initializeFirebaseMessaging() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a foreground message: ${message.notification?.title}');
      print('Received a foreground message: ${message.data["type"]}');
      print('Received a foreground message: ${message.data["order_id"]}');
      var notiType = message.data["type"].toString();
      Provider.of<ToolsViewModel>(appContext!, listen: false).getNotificationAPI(appContext!);
      Provider.of<ToolsViewModel>(appContext!, listen: false).getNotificationAPI(appContext!);
      if(notiType == "order"){
        print('111111111111111');
        Provider.of<ToolsViewModel>(appContext!, listen: false).getNotificationAPI(appContext!);
        Provider.of<ToolsViewModel>(appContext!, listen: false).getNotificationAPI(appContext!);
      }
      _displayNotification(message.notification!);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) { /// nav to screen
      print('User tapped on a notification: ${message.notification!.title}');
      print('User tapped on a notification: ${message.data["type"]}');
      print('User tapped on a notification: ${message.data["order_id"]}');
      print('User tapped on a notification: ${message.data}');

      var notiType = message.data["type"].toString();
      if(notiType == "delivery_order"){ /// this in other app of delivery  point
        print('111111111111111');
      }else if(notiType == "order") {
        print('444444444');
        // push(NotificationPage(orderId: message.data["order_id"].toString(),));
        push(NotificationPage());
      }

    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print('Received a background message: ${message.notification!.title}');
  }

  Future<void> _displayNotification(RemoteNotification notification) async {
    print("ffffff_____${notification.toString()}");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        icon: 'ic_launcher',
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.max,
        // styleInformation: androidImage,
        playSound: true,
        sound: null);
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      notification.title,
      notification.body,
      platformChannelSpecifics,
    );
  }
/// to handle Topic
// Future<void> subscribeToTopic(String topic) async {
//   await _firebaseMessaging.subscribeToTopic(topic);
// }
//
// Future<void> unsubscribeFromTopic(String topic) async {
//   await _firebaseMessaging.unsubscribeFromTopic(topic);
// }
}

///to do ..add this in main
// await Firebase.initializeApp();
// FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
// await firebaseMessagingService.initializeFirebaseMessaging();
//
// String? token = await firebaseMessagingService.getToken();
// print('Firebase token: $token');