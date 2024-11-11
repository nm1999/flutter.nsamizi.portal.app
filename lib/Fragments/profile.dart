import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/signin.dart';
import './../common/FormButton.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _onLogoutPressed() {
    Get.to(const SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image(image: AssetImage("assets/images/logo.png"))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Nsamizi Portal",
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "App Version",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "V_1.0.0",
                  style: GoogleFonts.montserrat(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "Call Support",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("0781260856 / 0706806111",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: FormButton(
                btnLabel: "logout",
                onBtnPressed: _onLogoutPressed,
                isOutlined: true,
                hasBorderRadius: false,
              ),
            ),
          ],
        ));
  }
}
