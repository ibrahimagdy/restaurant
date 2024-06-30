import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/core/widgets/custom_button.dart';

import '../../constants.dart';
import '../widgets/custom_text_form_field.dart';

void showPaymentBottomSheet(BuildContext context) {
  var mediaQuery = MediaQuery.of(context).size;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Form(
        key: formKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(
                'Add your payment methods',
                style: theme().textTheme.titleLarge,
              ),
              SizedBox(height: mediaQuery.height * 0.015),
              const Divider(thickness: 0.5),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      prefixIcon: SvgPicture.asset(
                        "assets/icons/card_icon.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      context: context,
                      controller: cardNumberController,
                      number: true,
                      hintText: "3999 - 1234 - 5678 - 0000",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else if (value.length != 16) {
                          return "Card number must be 16 digits";
                        } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return "Card number must be numeric";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: mediaQuery.height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            context: context,
                            controller: expiryDateController,
                            hintText: "MM/YY",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              } else if (!RegExp(r'^\d{2}/\d{2}$')
                                  .hasMatch(value)) {
                                return "Invalid format. Use MM/YY";
                              }
                              final now = DateTime.now();
                              final parts = value.split('/');
                              final month = int.parse(parts[0]);
                              final year = int.parse(parts[1]) + 2000;
                              final expiryDate = DateTime(year, month);

                              if (month < 1 || month > 12) {
                                return "Invalid month";
                              } else if (expiryDate.isBefore(now)) {
                                return "Card has expired";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextFormField(
                            context: context,
                            controller: cvcController,
                            number: true,
                            hintText: "CVC",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              } else if (value.length < 3 || value.length > 4) {
                                return "CVC must be 3 or 4 digits";
                              } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                                return "CVC must be numeric";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQuery.height * 0.02),
                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      buttonText: "Add Card",
                    ),
                    SizedBox(height: mediaQuery.height * 0.01),
                    CustomButton(
                      buttonColor: greyColor,
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      buttonText: "Scan Card",
                    ),
                    SizedBox(height: mediaQuery.height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
