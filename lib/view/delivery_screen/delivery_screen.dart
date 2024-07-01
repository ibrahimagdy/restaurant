import 'package:flutter/material.dart';

import 'features/delivery_destnation_details.dart';
import 'features/delivery_order_details.dart';

class DeliveryScreen extends StatelessWidget {
  static const String id = 'OngoingScreen';

  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/map_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: mediaQuery.height * 0.25),
                const DeliveryOrderDetails(),
                SizedBox(height: mediaQuery.height * 0.02),
                const DeliveryDestinationDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
