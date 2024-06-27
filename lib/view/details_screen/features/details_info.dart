import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../core/utils/theme.dart';
import '../../../model/best_partners_model.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as BestPartnersModel;
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mediaQuery.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(args.name,
                      style: theme()
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  SvgPicture.asset("assets/icons/shield-check.svg"),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFEBE5).withOpacity(0.3),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Text("Take Away",
                        style: TextStyle(color: primaryColor)),
                  ),
                  SizedBox(width: mediaQuery.width * 0.02),
                  Icon(CupertinoIcons.heart_fill, color: primaryColor),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                args.state,
                style: theme().textTheme.labelSmall!.copyWith(
                    color: args.state == "Open"
                        ? const Color(0xFF00875A)
                        : Colors.red),
              ),
              const SizedBox(width: 10),
              Text(
                " .   ${args.address}",
                style:
                    theme().textTheme.labelMedium!.copyWith(color: thirdColor),
              ),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          const Divider(thickness: 0.5),
          SizedBox(height: mediaQuery.height * 0.015),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(args.rate, style: TextStyle(color: white)),
                  ],
                ),
              ),
              Text(
                "   .   ",
                style: TextStyle(color: thirdColor),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/time_icon.svg"),
                  SizedBox(width: mediaQuery.width * 0.02),
                  Text(args.time),
                ],
              ),
              Text(
                "   .   ",
                style: TextStyle(color: thirdColor),
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/shipping_icon.svg"),
                  SizedBox(width: mediaQuery.width * 0.02),
                  Text(args.shipping),
                ],
              ),
            ],
          ),
          SizedBox(height: mediaQuery.height * 0.03),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.percent,
                  color: primaryColor,
                ),
                SizedBox(width: mediaQuery.width * 0.04),
                Text(
                  'Save \$15.00 with code Total Dish',
                  style: theme().textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: mediaQuery.height * 0.025),
        ],
      ),
    );
  }
}
