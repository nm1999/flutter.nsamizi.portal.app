import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Scan/DocumentScanScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _buildHeader(context),

          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ScanDocument());
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image(
                              image: AssetImage('images/archive.jpg'),
                            ),
                          ),
                          Text("Paper Backup", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image(image: AssetImage('images/exam.jpg')),
                        ),

                        Text("View results", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              'Copyright © $currentYear NTISD. All rights reserved.',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF5B64FF), Color(0xFF7E9CFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Welcome back! Manage your documents and results with ease.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.14),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.dashboard,
                  color: Color(0xFF5B64FF),
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
