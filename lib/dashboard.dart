import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Welcome to the dashboard"),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, size: 40),
                        SizedBox(height: 10),
                        Text("Scan Document"),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, size: 40),
                        SizedBox(height: 10),
                        Text("Scan Document"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, size: 40),
                        SizedBox(height: 10),
                        Text("Scan Document"),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, size: 40),
                        SizedBox(height: 10),
                        Text("Scan Document"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, size: 40),
                        SizedBox(height: 10),
                        Text("Scan Document"),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.document_scanner, size: 40),
                        SizedBox(height: 10),
                        Text("Scan Document"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Text(
                  "Copyright © $currentYear NTISD.",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "All rights reserved.",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
