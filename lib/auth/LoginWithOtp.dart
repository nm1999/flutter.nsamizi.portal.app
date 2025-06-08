import 'package:flutter/material.dart';
import 'package:nsamiziportal/auth/firebaseAuth.dart';
import 'package:nsamiziportal/common/FormButton.dart';
import 'package:nsamiziportal/common/FormEditText.dart';
import 'package:nsamiziportal/common/colors.dart';

class LoginWithOTP extends StatefulWidget {
  const LoginWithOTP({super.key});

  @override
  State<LoginWithOTP> createState() => _LoginWithOTPState();
}

class _LoginWithOTPState extends State<LoginWithOTP> {
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();
  Firebaseauth authService = Firebaseauth();
  String verificationId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.mainColor,title: Text("OTP"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Enter your phone number"),
            FormEditText(
                inputLabel: "Phone number",
                textInputType: TextInputType.text,
                controller: phone,
                isHidden: false),
            FormButton(
                btnLabel: "Verify number",
                onBtnPressed: () async {
                  String? code = await authService.phoneLogin(phone.text);
                  setState(() {
                    verificationId = code!;
                  });
                },
                isOutlined: false,
                hasBorderRadius: true),
            
            
            Text("Enter OTP"),
            FormEditText(
                inputLabel: "OTP",
                textInputType: TextInputType.number,
                controller: otp,
                isHidden: false),
            FormButton(
                btnLabel: "Verify OTP",
                onBtnPressed: () async {
                  await authService.checkPhoneVerification(verificationId, otp.text);
                },
                isOutlined: false,
                hasBorderRadius: true),
        
            
          ],
        ),
      ),
    );
  }
}
