import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/theme.dart';

import '../../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final BuildContext context;
  final String? labelText;
  final TextEditingController controller;
  bool? border = true;
  bool? number = false;
  bool? password = false;
  String? value;
  double length;
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  final String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    required this.context,
    this.labelText,
    required this.controller,
    this.border,
    this.value,
    this.number,
    this.password,
    this.length = 0,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: value == null ? controller : null,
      initialValue: value,
      obscureText: password ?? false,
      validator: validator,
      keyboardType: number == true ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: length == 0 ? null : EdgeInsets.only(bottom: length),
        labelText: labelText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: greyColor,
        filled: true,
        hintStyle: theme().textTheme.titleSmall,
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    );
  }
}