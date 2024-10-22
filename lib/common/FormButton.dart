import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String btnLabel;
  final Function() onBtnPressed;
  final bool isOutlined;
  const FormButton(
      {super.key,
      required this.btnLabel,
      required this.onBtnPressed,
      required this.isOutlined});

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onBtnPressed,
        child: Text(btnLabel, style: const TextStyle(color: Colors.red,fontSize: 16)),
      );
    } else {
      return MaterialButton(
        onPressed: onBtnPressed,
        color: Colors.red,
        elevation: 3,
        child: Text(btnLabel,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      );
    }
  }
}
