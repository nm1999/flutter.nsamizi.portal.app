import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './Scan/DocumentScanScreen.dart';
import './results/view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int currentYear = DateTime.now().year;
  List<Widget> _pages = [
    Dashboard(),
    Center(child: Text("Search")),
    ResultsView(),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FF),
      body: SafeArea(child: _pages[0]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [Icon(Icons.home_sharp, size: 30), Text("Home")]),
            Column(
              children: [
                Icon(Icons.manage_search_sharp, size: 30),
                Text("Search"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.my_library_add_sharp, size: 30),
                Text("Library"),
              ],
            ),
            Column(
              children: [Icon(Icons.settings, size: 30), Text("Settings")],
            ),
          ],
        ),
      ),
    );
  }
}
