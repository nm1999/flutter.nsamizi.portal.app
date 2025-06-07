import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class Firebaseauth {
  Future<String?> getFCMToken() async {
    await askForPermission();
    String ? token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  Future<void> askForPermission() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    Get.snackbar("Notification",settings.authorizationStatus.toString());
  }
}