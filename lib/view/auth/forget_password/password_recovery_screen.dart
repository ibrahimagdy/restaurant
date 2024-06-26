import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/view/auth/forget_password/verify_identity_screen.dart';

import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  static const String id = 'PasswordRecoveryScreen';

  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: mediaQuery.height * 0.04),
                SvgPicture.asset("assets/icons/Logo.svg"),
                SizedBox(height: mediaQuery.height * 0.04),
                Text(
                  'Password Recovery',
                  textAlign: TextAlign.center,
                  style: theme().textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your email to recover your password',
                  textAlign: TextAlign.center,
                  style: theme().textTheme.titleSmall,
                ),
                SizedBox(height: mediaQuery.height * 0.04),
                CustomTextFormField(
                  context: context,
                  controller: emailController,
                  hintText: 'Email',
                ),
                SizedBox(height: mediaQuery.height * 0.03),
                CustomButton(
                  buttonText: 'Sign in',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, VerifyIdentityScreen.id);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
