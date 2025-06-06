import 'package:flutter/material.dart';

class FormEditText extends StatelessWidget {
  final String inputLabel;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool isHidden;

  const FormEditText(
      {super.key,
      required this.inputLabel,
      required this.textInputType,
      required this.controller,
      required this.isHidden});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isHidden,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        labelText: inputLabel,
      ),
    );
  }
}
