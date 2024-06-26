import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';

class CustomPhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  final Function(PhoneNumber) onPhoneNumberChanged;
  final String? Function(String?)? validator;

  const CustomPhoneNumberField({
    super.key,
    required this.controller,
    required this.onPhoneNumberChanged,
    this.validator,
  });

  @override
  State<CustomPhoneNumberField> createState() => _CustomPhoneNumberFieldState();
}

class _CustomPhoneNumberFieldState extends State<CustomPhoneNumberField> {
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Phone Number',
                style: theme().textTheme.titleSmall,
              ),
            ],
          ),
          const SizedBox(height: 10),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              widget.onPhoneNumberChanged(number);
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: widget.controller,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputDecoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '202 555 0132',
            ),
            validator: widget.validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
            onSaved: (PhoneNumber number) {},
          ),
        ],
      ),
    );
  }
}
