import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountabilityScreen extends StatefulWidget {
  const AccountabilityScreen({super.key});

  @override
  State<AccountabilityScreen> createState() => _AccountabilityScreenState();
}

class _AccountabilityScreenState extends State<AccountabilityScreen> {
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
      body: const Center(
        child: Text("Accountability Screen"),
      ),
    );
  }
}
