import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/theme.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    this.onTap,
    required this.buttonText,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = buttonColor ?? primaryColor;
    final Color txtColor =
        textColor ?? (bgColor == primaryColor ? Colors.white : Colors.black);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: theme().textTheme.bodyLarge?.copyWith(color: txtColor),
          ),
        ),
      ),
    );
  }
}
