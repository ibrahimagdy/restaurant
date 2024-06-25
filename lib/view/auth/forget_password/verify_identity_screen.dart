import 'package:flutter/material.dart';
import 'package:restaurant/view/auth/forget_password/reset_password_screen.dart';

import '../../../core/widgets/custom_verify_code.dart';

class VerifyIdentityScreen extends StatelessWidget {
  static const String id = 'VerifyIdentityScreen';

  const VerifyIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: VerifyCodeWidget(
          title: 'Verify your identity',
          message: 'We have just sent a code to\njos.creative@gmail.com.',
          sendAgainButtonText: 'Send again',
          expectedOtp: '1234',
          showTerms: false,
          onNextTap: () {
            Navigator.pushNamed(context, ResetPasswordScreen.id);
          },
        ),
      ),
    );
  }
}
