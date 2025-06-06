import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'sharedpref.dart';

Timer? timer;

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
  }
}
