import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../localDB/sqliteservice.dart';

class AccountabilityScreen extends StatefulWidget {
  const AccountabilityScreen({super.key});

  @override
  State<AccountabilityScreen> createState() => _AccountabilityScreenState();
}

class _AccountabilityScreenState extends State<AccountabilityScreen> {
  DatabaseHelper db = DatabaseHelper();
  List expenses = [];

  getExpenses() {
    db.getAllExpenses().then((res) {
      setState(() {
        expenses = res;
      });
    });
  }

  @override
  void initState() {
    getExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Accountability",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(expenses[index]["student_id"]),
              Text(expenses[index]["amount_removed"]),
            ],
          ),
          subtitle: Container(
            decoration:const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black, // Border color
                  width: 0.5, // Border width
                ),
              ),
            ),
            child: Text(expenses[index]['reason'])),

        );
      },itemCount: expenses.length,),
    );
  }
}
