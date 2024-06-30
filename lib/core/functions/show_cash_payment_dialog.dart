import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/view/home_screen/home_screen.dart';

void showCashPaymentDialog(BuildContext context) {
  var mediaQuery = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: SvgPicture.asset("assets/icons/success_icon.svg"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You ordered successfully',
            style: theme().textTheme.titleLarge,
          ),
          SizedBox(height: mediaQuery.height * 0.01),
          Text(
            'You successfully place an order, your order is\nconfirmed and delivered within 20 minutes.\nWish you enjoy the food',
            style: theme()
                .textTheme
                .labelSmall!
                .copyWith(color: thirdColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
            child: Text(
              'KEEP BROWSING',
              style:
                  theme().textTheme.labelMedium!.copyWith(color: primaryColor),
            ),
          ),
        ],
      ),
    ),
  );
}
