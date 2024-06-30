import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_text_form_field.dart';

import '../../../core/utils/theme.dart';
import '../../home_layout/home_layout.dart';

class EnterNewAddressScreen extends StatefulWidget {
  static const String id = 'EnterNewAddressScreen';

  const EnterNewAddressScreen({super.key});

  @override
  State<EnterNewAddressScreen> createState() => _EnterNewAddressScreenState();
}

class _EnterNewAddressScreenState extends State<EnterNewAddressScreen> {
  TextEditingController addressController = TextEditingController();
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
                  hintText: 'Enter your address',
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/address_icon.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Address is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: mediaQuery.height * 0.09),
                CustomButton(
                  buttonText: 'Go To Home',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, HomeLayout.id);
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
