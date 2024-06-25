import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_sign_in_button.dart';

import '../../../core/utils/theme.dart';
import 'enter_new_address_screen.dart';

class CurrentLocationScreen extends StatelessWidget {
  static const String id = 'CurrentLocationScreen';

  const CurrentLocationScreen({super.key});

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
              SvgPicture.asset("assets/icons/location.svg"),
              SizedBox(height: mediaQuery.height * 0.04),
              Text(
                'Find Nearby Restaurants',
                textAlign: TextAlign.center,
                style: theme().textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Enter your location or allow access to your\nlocation to find restaurants near you.',
                textAlign: TextAlign.center,
                style: theme().textTheme.titleSmall,
              ),
              SizedBox(height: mediaQuery.height * 0.04),
              CustomButton(
                buttonText: 'Use current location',
                buttonColor: greyColor,
                textColor: const Color(0xFF172B4D),
              ),
              const SizedBox(height: 10),
              CustomSignInButton(
                icon: SvgPicture.asset("assets/icons/address_icon.svg"),
                text: "Enter a new address",
                containerColor: greyColor,
                onTap: () {
                  Navigator.pushNamed(context, EnterNewAddressScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
