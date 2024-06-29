import 'package:flutter/material.dart';

import '../../../../core/functions/show_order_bottom_sheet.dart';
import '../../../../model/best_partners_model.dart';
import '../../../../model/popular_items_model.dart';
import '../delivery_info_widgets/popular_items_widget.dart';

class PopularItemsList extends StatelessWidget {
  final BestPartnersModel restaurant;

  const PopularItemsList({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularItems.length,
      itemBuilder: (context, index) {
        final item = popularItems[index];
        return GestureDetector(
          onTap: () {
            showOrderBottomSheet(
              context,
              item.name,
              item.subtitle,
              item.orderImage,
              item.price,
              item.confirmOrderImage,
              partnerName: restaurant.name,
              partnerAddress: restaurant.address,
              partnerRate: restaurant.rate,
              partnerDistance: restaurant.distance,
            );
          },
          child: SizedBox(
            width: mediaQuery.width * 0.35,
            child: PopularItemsWidget(item: item),
          ),
        );
      },
    );
  }
}
