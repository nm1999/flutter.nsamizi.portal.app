import 'package:flutter/material.dart';

import '../../common/colors.dart';

class BpamResult extends StatefulWidget {
  const BpamResult({super.key});

  @override
  State<BpamResult> createState() => _BpamResultState();
}

class _BpamResultState extends State<BpamResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Text("Results"),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
