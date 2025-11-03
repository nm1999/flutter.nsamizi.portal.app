import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsamiziportal/functions/googleAuth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GoogleAuthService googleAuth = GoogleAuthService();

  void _continueWithGoogle() {
    googleAuth.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    width: 90,
                    height: 90,
                    bottom: 10,
                    left: 250,
                    child: Image.asset('images/logo.png'),
                  ),
                ],
              ),
            ),

            Text(
              'Welcome to Nsamizi training institute of social development lira Student portal.',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 150),
            Text(
              'You need to have a google account, click the button below to access the app features.',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continueWithGoogle,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.orange,
                ), 
              ),
              child: Text(
                'Continue with Google',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
