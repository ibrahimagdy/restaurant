import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/core/widgets/custom_button.dart';

import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_phone_number_field.dart';
import 'verify_phone_number_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  static const String id = 'PhoneNumberScreen';

  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneNumberController = TextEditingController();
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
                SizedBox(height: mediaQuery.height * 0.03),
                SvgPicture.asset("assets/icons/Logo.svg"),
                SizedBox(height: mediaQuery.height * 0.05),
                Text(
                  'Get started with Cook',
                  textAlign: TextAlign.center,
                  style: theme().textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your phone number',
                  textAlign: TextAlign.center,
                  style: theme().textTheme.titleSmall,
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                CustomPhoneNumberField(
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  onPhoneNumberChanged: (number) {},
                ),
                SizedBox(height: mediaQuery.height * 0.04),
                CustomButton(
                  buttonText: 'Next',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, VerifyPhoneNumberScreen.id);
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
