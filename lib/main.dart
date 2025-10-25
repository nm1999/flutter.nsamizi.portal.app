import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nsamiziportal/scanDocument.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Splashscreen());
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Get.off(ScanDocument());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Nsamizi training institute of social development - Lira Campus",
          ),
          Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(color: Colors.blueAccent,),
            ),
          ),
        ],
      ),
    );
  }
}
