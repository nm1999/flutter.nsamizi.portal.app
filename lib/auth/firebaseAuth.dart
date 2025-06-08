import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class Firebaseauth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<String ?> phoneLogin(String phoneNo) async {
      var code = "";
      await _auth.verifyPhoneNumber(
        phoneNumber:phoneNo,
        verificationCompleted:(phoneAuthCredential) {
          print(phoneAuthCredential);
        }, 
        verificationFailed:(error) {
            print(error);
        }, 
        codeSent: (verificationId, forceResendingToken) {
          print(verificationId);
        }, 
        codeAutoRetrievalTimeout:(verificationId) {
          // verification code required at phone verification
          //checked with otp
          print(verificationId);
          code = (verificationId);
        },
      );
      print("here is the verificaiton code $code");
      return code;
  }

  Future<bool> checkPhoneVerification (String verificatonCode, String userOTp) async{
    String code = "AD8T5IvYqhE7wAk43qi63hyPzomzmLfvORGS1uDgEN5OsMJKqHqJYxLCHIgun-KdqgdYLEW8SocIuGFUlfsaCDz1CNjPusC_DRB7A_YcDiogoI0Npmw9MPwE1wwdjODT0VhTW-YuBKkuggtdGgj19XZhrBQs3TlMrg";
    PhoneAuthCredential cred = PhoneAuthProvider.credential(verificationId: code, smsCode: userOTp);
    try {
      final response =  await _auth.signInWithCredential(cred);
      print(response);
      return false;
    } catch (e) {
      return false;
    }
  }
}