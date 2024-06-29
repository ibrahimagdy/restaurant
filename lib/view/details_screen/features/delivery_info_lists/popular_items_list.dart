import 'package:flutter/material.dart';

import '../../../../core/functions/show_order_bottom_sheet.dart';
import '../../../../model/popular_items_model.dart';
import '../delivery_info_widgets/popular_items_widget.dart';

class PopularItemsList extends StatelessWidget {
  const PopularItemsList({super.key});

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
