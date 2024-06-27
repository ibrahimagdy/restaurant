import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';

import '../../../core/utils/theme.dart';
import 'delivery_info_view.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelStyle: theme().textTheme.bodySmall,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: thirdColor,
            labelPadding: const EdgeInsets.only(bottom: 10),
            tabs: const [
              Tab(text: "Delivery"),
              Tab(text: "Review"),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                DeliveryInfoView(),
                Center(child: Text("Review Info")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
