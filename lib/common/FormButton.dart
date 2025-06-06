import 'package:flutter/material.dart';
import 'package:nsamiziportal/common/colors.dart';

class FormButton extends StatelessWidget {
  final String btnLabel;
  final Function() onBtnPressed;
  final bool isOutlined;
  final bool hasBorderRadius;
  const FormButton(
      {super.key,
      required this.btnLabel,
      required this.onBtnPressed,
      required this.isOutlined,
      required this.hasBorderRadius});

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onBtnPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(hasBorderRadius ? 20 : 10)), // Add rounded corners
        ),
        child: Text(
          btnLabel,
          style: const TextStyle(color: AppColor.mainColor, fontSize: 16),
        ),
      );
    } else {
      return MaterialButton(
        onPressed: onBtnPressed,
        color: AppColor.mainColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(hasBorderRadius ? 20 : 10))),
        child: Text(btnLabel,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      );
    }
  }
}
