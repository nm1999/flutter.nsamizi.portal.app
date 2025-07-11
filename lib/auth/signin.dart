import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/auth/LoginWithOtp.dart';
import 'package:nsamiziportal/common/FormButton.dart';
import 'package:nsamiziportal/screens/home_screen.dart';
import '../common/FormEditText.dart';
import '../common/colors.dart';
import 'firebaseAuth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Firebaseauth fb = Firebaseauth();

  _proceedToDashboard() async {
    String? fcm = await fb.getFCMToken();
    print(fcm);
    Get.to(const HomeScreen());
  }

  _proceedToSelfRegister() {
    Get.to(const LoginWithOTP());
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.mainColor,toolbarHeight: 3,),
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
                  height: 20,
                ),
                Text(
                  "Easy to Learn,discover more skills",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                Text(
                  "Signin into your account",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password',
                      style: GoogleFonts.aBeeZee(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: AppColor.mainColor),
                    ),
                    const SizedBox(width:10,),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: _width,
                    height: 50,
                    child: FormButton(
                      btnLabel: "Login",
                      onBtnPressed: _proceedToDashboard,
                      isOutlined: false,
                      hasBorderRadius: false,
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: _width,
                    height: 45,
                    child: FormButton(
                      btnLabel: "New user ? Register",
                      onBtnPressed: _proceedToSelfRegister,
                      isOutlined: true,
                      hasBorderRadius: false,
                    )),                
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
