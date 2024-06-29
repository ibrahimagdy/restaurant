import 'package:flutter/material.dart';

import '../../../../core/functions/show_order_bottom_sheet.dart';
import '../../../../model/fried_chicken_model.dart';
import '../delivery_info_widgets/fried_chicken_widget.dart';

class FriedChickenList extends StatelessWidget {
  const FriedChickenList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = friedModel[index];
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
            child: FriedChickenWidget(item: item),
          );
        },
        childCount: friedModel.length,
      ),
    );
  }
}
