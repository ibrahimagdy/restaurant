import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/view/details_screen/features/details_info.dart';

import 'features/custom_tab_view.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: mediaQuery.height * 0.3,
                child: Image.asset(
                  "assets/images/bk_header.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            top: mediaQuery.height * 0.26,
            left: 0,
            right: 0,
            child: Container(
              width: mediaQuery.width,
              height: mediaQuery.height * 0.65,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                children: [
                  DetailsInfo(),
                  Divider(thickness: 0.5),
                  Expanded(child: CustomTabView()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
