import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'sharedpref.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Timer? timer;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  print('TItle ${message.notification?.title}');
  print('Body ${message.notification?.body}');
  print('TItle ${message.data}');
  // _showNotification(0, message.notification?.title, message.notification?.body);
}

Future _requestPermissions() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon'); // Replace with your app icon

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> _showNotification(channelId, title, description) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails("your_channel_id", "Your Channel Name",
          channelDescription: "Your channel description",
          icon: '@mipmap/ic_launcher');

  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  // await flutterLocalNotificationsPlugin.show(
  //   channelId,
  //   title,
  //   description,
  //   platformChannelSpecifics,
  //   payload: 'item x',
  // );
}

class FirebaseApi {
  final _firebasemessaging = FirebaseMessaging.instance;
  SharedPref sharedpref = SharedPref();

  Future<void> initNotifications() async {
    await _firebasemessaging.requestPermission();
    final fcmToken = await _firebasemessaging.getToken();
    sharedpref.setFcmToken(fcmToken);
    print("Here is the fcmtoken");
    print(fcmToken);
    print("end of the token");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification?.body);
      _showNotification(
          0, message.notification?.title, message.notification?.body);
    });
  }
}
