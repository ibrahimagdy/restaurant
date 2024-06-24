import 'package:flutter/material.dart';

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
      body: const SingleChildScrollView(
        child: VerifyCodeWidget(
          title: 'Verify your identity',
          message: 'We have just sent a code to\njos.creative@gmail.com.',
          sendAgainButtonText: 'Send again',
          showTerms: false,
        ),
      ),
    );
  }
}
