import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = 'ResetPasswordScreen';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: mediaQuery.height * 0.04),
              SvgPicture.asset("assets/icons/Logo.svg"),
              SizedBox(height: mediaQuery.height * 0.04),
              Text(
                'Reset your password',
                textAlign: TextAlign.center,
                style: theme().textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                'At least 8 characters including uppercase and\nlowercase letters',
                textAlign: TextAlign.center,
                style: theme().textTheme.titleSmall,
              ),
              SizedBox(height: mediaQuery.height * 0.04),
              CustomTextFormField(
                context: context,
                controller: passwordController,
                hintText: 'New Password',
                password: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                context: context,
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                password: !isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.03),
              CustomButton(
                buttonText: 'Update',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
