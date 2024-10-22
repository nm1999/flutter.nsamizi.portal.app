import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/common/FormButton.dart';
import 'package:nsamiziportal/screens/home_screen.dart';
import '../common/FormEditText.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  _proceedToDashboard() {
    Get.to(const HomeScreen());
  }

  _proceedToSelfRegister() {}

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.adamina(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.green),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                const SizedBox(
                  height: 10,
                ),
                FormEditText(
                  inputLabel: "Username",
                  textInputType: TextInputType.emailAddress,
                  controller: usernameController,
                  isHidden: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormEditText(
                    isHidden: true,
                    inputLabel: "Password",
                    textInputType: TextInputType.visiblePassword,                    
                    controller: passwordController),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password',
                      style: GoogleFonts.aBeeZee(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: _width,
                    height: 50,
                    child: FormButton(
                        btnLabel: "Login",
                        onBtnPressed:_proceedToDashboard,
                        isOutlined: false)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: _width,
                    height: 40,
                    child: FormButton(
                        btnLabel: "New user ? Register",
                        onBtnPressed: _proceedToSelfRegister,
                        isOutlined: true))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
