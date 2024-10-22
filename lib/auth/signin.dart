import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/common/FormButton.dart';
import '../common/FormEditText.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text("Login",
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            FormEditText(
              inputLabel: "Username",
              textInputType: TextInputType.text,
              controller: usernameController,
              isHidden: false,
            ),
            const SizedBox(
              height: 20,
            ),
            FormEditText(
              inputLabel: "Password",
              textInputType: TextInputType.text,
              controller: passwordController,
              isHidden: true,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                child: FormButton(
                    btnLabel: "Login", onBtnPressed: () {}, isOutlined: false)),
                    const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 40,
                child: FormButton(
                    btnLabel: "self register", onBtnPressed: () {}, isOutlined: true)),
          ],
        ),
      ),
    );
  }
}
