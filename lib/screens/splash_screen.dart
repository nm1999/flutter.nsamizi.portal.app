import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/auth/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timingScreen();
    super.initState();
  }

  timingScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(SignInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
            child: SizedBox(
                width: 100,
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                        height: 70,
                        width: 70,
                        child:
                            Image(image: AssetImage("assets/images/logo.png"))),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  ],
                ))),
      ),
    );
  }
}
