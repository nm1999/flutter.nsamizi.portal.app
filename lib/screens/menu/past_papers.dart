import 'package:flutter/material.dart';

import '../../common/colors.dart';

class PastPapers extends StatefulWidget {
  const PastPapers({super.key});

  @override
  State<PastPapers> createState() => _PastPapersState();
}

class _PastPapersState extends State<PastPapers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Text("Past papers"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
            
        ],
      ),
    );
  }
}
