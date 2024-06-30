import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../core/utils/theme.dart';

class DeliveryLocationWidget extends StatelessWidget {
  const DeliveryLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  "Delivery to",
                  style: theme().textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const Divider(thickness: 0.5),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 10),
            child: ListTile(
              leading: Image.asset(
                "assets/images/Mini_Map.png",
                fit: BoxFit.cover,
              ),
              title: Text(
                "(323) 238-0678\n909-1/2 E 49th St\nLos Angeles, California(CA), 90011",
                style: theme().textTheme.labelSmall!.copyWith(
                    color: secondaryColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  SvgPicture.asset("assets/icons/address_icon.svg"),
                  Text(args['partnerDistance'] ?? ''),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
