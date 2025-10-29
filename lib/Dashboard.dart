import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsamiziportal/scanDocument.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height:10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello ,",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50, width: 50, child: CircleAvatar()),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Get.to(ScanDocument());
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Icon(Icons.scanner, color: Colors.amber, size: 40),
                            Text("Scan paper", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(Icons.search, color: Colors.blue, size: 40),
                          Text("Search paper", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
