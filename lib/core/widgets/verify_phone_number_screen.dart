import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/constants.dart';

import '../utils/theme.dart';
import 'custom_button.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const String id = 'VerifyPhoneNumberScreen';

  const VerifyPhoneNumberScreen({super.key});

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  final TextEditingController digit1Controller = TextEditingController();
  final TextEditingController digit2Controller = TextEditingController();
  final TextEditingController digit3Controller = TextEditingController();
  final TextEditingController digit4Controller = TextEditingController();

  final FocusNode digit1FocusNode = FocusNode();
  final FocusNode digit2FocusNode = FocusNode();
  final FocusNode digit3FocusNode = FocusNode();
  final FocusNode digit4FocusNode = FocusNode();

  Color digit1DividerColor = primaryColor;
  Color digit2DividerColor = thirdColor;
  Color digit3DividerColor = thirdColor;
  Color digit4DividerColor = thirdColor;

  @override
  void initState() {
    super.initState();
    digit1Controller.addListener(() {
      if (digit1Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(digit2FocusNode);
        setState(() {
          digit2DividerColor = primaryColor;
        });
      }
    });
    digit2Controller.addListener(() {
      if (digit2Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(digit3FocusNode);
        setState(() {
          digit3DividerColor = primaryColor;
        });
      }
    });
    digit3Controller.addListener(() {
      if (digit3Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(digit4FocusNode);
        setState(() {
          digit4DividerColor = primaryColor;
        });
      }
    });
    digit4Controller.addListener(() {
      if (digit4Controller.text.length == 1) {
        digit4FocusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    digit1Controller.dispose();
    digit2Controller.dispose();
    digit3Controller.dispose();
    digit4Controller.dispose();
    digit1FocusNode.dispose();
    digit2FocusNode.dispose();
    digit3FocusNode.dispose();
    digit4FocusNode.dispose();
    super.dispose();
  }

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
              SizedBox(height: mediaQuery.height * 0.03),
              SvgPicture.asset("assets/icons/Logo.svg"),
              SizedBox(height: mediaQuery.height * 0.05),
              Text(
                'Verify phone number',
                textAlign: TextAlign.center,
                style: theme().textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                'We have just sent a code to +12025550132.',
                textAlign: TextAlign.center,
                style: theme().textTheme.titleSmall,
              ),
              SizedBox(height: mediaQuery.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDigitField(
                      digit1Controller, digit1FocusNode, digit1DividerColor),
                  _buildDigitField(
                      digit2Controller, digit2FocusNode, digit2DividerColor),
                  _buildDigitField(
                      digit3Controller, digit3FocusNode, digit3DividerColor),
                  _buildDigitField(
                      digit4Controller, digit4FocusNode, digit4DividerColor),
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.04),
              const CustomButton(buttonText: 'Next'),
              SizedBox(height: mediaQuery.height * 0.02),
              CustomButton(
                  buttonText: 'Send again',
                  buttonColor: greyColor,
                  textColor: Colors.black),
              SizedBox(height: mediaQuery.height * 0.03),
              Text(
                'By signing up you agree to',
                textAlign: TextAlign.center,
                style: theme().textTheme.titleSmall,
              ),
              Text(
                'our terms of service and privacy policy.',
                textAlign: TextAlign.center,
                style:
                    theme().textTheme.titleSmall!.copyWith(color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDigitField(TextEditingController controller, FocusNode focusNode,
      Color dividerColor) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 75,
      height: 75,
      child: Stack(
        children: [
          Center(
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Divider(
              color: dividerColor,
              indent: 15,
              endIndent: 15,
              thickness: 2,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
  }
}
