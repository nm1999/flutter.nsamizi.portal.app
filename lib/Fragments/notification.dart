import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationFragment extends StatefulWidget {
  const NotificationFragment({super.key});

  @override
  State<NotificationFragment> createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Notifications",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            isThreeLine: false,
            shape: BeveledRectangleBorder(side: BorderSide(width:0.1)),
            title: Text(
              "Paid 250000 as tuition",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "Atim loy - NCPA",
              style: GoogleFonts.montserrat(),
            ),
            leading: const SizedBox(
                height: 30,
                width: 30,
                child: Image(image: AssetImage('assets/images/logo.png'))),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
