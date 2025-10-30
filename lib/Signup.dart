import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Text("SignUp"),
          TextButton(onPressed: (){}, child: Text('Continue with Google'))
        ]
      )
    );
  }
}