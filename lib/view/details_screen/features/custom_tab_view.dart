import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/view/details_screen/features/review_info_widgets/users_review.dart';

import '../../../core/utils/theme.dart';
import '../../../model/best_partners_model.dart';
import 'delivery_info_view.dart';

class CustomTabView extends StatelessWidget {
  final BestPartnersModel restaurant;

  const CustomTabView({super.key, required this.restaurant});

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
          Expanded(
            child: TabBarView(
              children: [
                DeliveryInfoView(restaurant: restaurant),
                const UsersReview(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
