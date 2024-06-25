import 'package:flutter/material.dart';

import '../../../core/widgets/custom_verify_code.dart';
import '../location/current_location_screen.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  static const String id = 'VerifyPhoneNumberScreen';

  const VerifyPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: VerifyCodeWidget(
          title: 'Verify phone number',
          message: 'We have just sent a code to +12025550132.',
          sendAgainButtonText: 'Send again',
          showTerms: true,
          expectedOtp: '1234',
          onNextTap: () {
            Navigator.pushNamed(context, CurrentLocationScreen.id);
          },
        ),
      ),
    );
  }
}
