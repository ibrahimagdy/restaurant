import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/constants.dart';

import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_button.dart';

class VerifyCodeWidget extends StatefulWidget {
  final String title;
  final String message;
  final String sendAgainButtonText;
  final bool showTerms;
  final VoidCallback? onNextTap;
  final String expectedOtp;

  const VerifyCodeWidget({
    super.key,
    required this.title,
    required this.message,
    required this.sendAgainButtonText,
    this.showTerms = true,
    this.onNextTap,
    required this.expectedOtp,
  });

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  final TextEditingController digit1Controller = TextEditingController();
  final TextEditingController digit2Controller = TextEditingController();
  final TextEditingController digit3Controller = TextEditingController();
  final TextEditingController digit4Controller = TextEditingController();
  final List<Color> dividerColors = List<Color>.filled(4, thirdColor);

  bool invalidOtp = false;

  void verifyOtp() {
    String enteredOtp = digit1Controller.text +
        digit2Controller.text +
        digit3Controller.text +
        digit4Controller.text;
    if (enteredOtp == widget.expectedOtp) {
      setState(() {
        invalidOtp = false;
      });
      if (widget.onNextTap != null) {
        widget.onNextTap!();
      }
    } else {
      setState(() {
        invalidOtp = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: mediaQuery.height * 0.03),
          SvgPicture.asset("assets/icons/Logo.svg"),
          SizedBox(height: mediaQuery.height * 0.05),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: theme().textTheme.displaySmall,
          ),
          const SizedBox(height: 10),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: theme().textTheme.titleSmall,
          ),
          SizedBox(height: mediaQuery.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDigitField(digit1Controller, 0),
              buildDigitField(digit2Controller, 1),
              buildDigitField(digit3Controller, 2),
              buildDigitField(digit4Controller, 3),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.04),
          if (invalidOtp)
            const Text(
              'Invalid Verify Code',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          SizedBox(height: mediaQuery.height * 0.02),
          CustomButton(
            buttonText: 'Next',
            onTap: verifyOtp,
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          CustomButton(
            buttonText: widget.sendAgainButtonText,
            buttonColor: greyColor,
            textColor: Colors.black,
          ),
          if (widget.showTerms) ...[
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
        ],
      ),
    );
  }

  Widget buildDigitField(TextEditingController controller, int index) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 75,
      height: 75,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: TextFormField(
              controller: controller,
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  setState(() {
                    dividerColors[index] = primaryColor;
                  });
                }
              },
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
              color: dividerColors[index],
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
