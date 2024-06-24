import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  final Color containerColor;
  final Widget icon;
  final String text;

  const CustomSignInButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.transparent),
      ),
      child: ListTile(
        leading: icon,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(text),
        )),
      ),
    );
  }
}
