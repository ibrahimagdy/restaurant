import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/core/widgets/custom_text_form_field.dart';

import '../../../core/utils/theme.dart';

class EnterNewAddressScreen extends StatefulWidget {
  static const String id = 'EnterNewAddressScreen';

  const EnterNewAddressScreen({super.key});

  @override
  State<EnterNewAddressScreen> createState() => _EnterNewAddressScreenState();
}

class _EnterNewAddressScreenState extends State<EnterNewAddressScreen> {
  TextEditingController addressController = TextEditingController();

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
              CustomTextFormField(
                context: context,
                controller: addressController,
                prefixIcon: SvgPicture.asset(
                  "assets/icons/address_icon.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
