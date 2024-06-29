import 'package:flutter/material.dart';

import '../../../../core/functions/show_order_bottom_sheet.dart';
import '../../../../model/combo_burger_model.dart';
import '../delivery_info_widgets/combo_burger_widget.dart';

class ComboBurgerList extends StatelessWidget {
  const ComboBurgerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = comboBgModel[index];
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
            child: ComboBurgerWidget(item: item),
          );
        },
        childCount: comboBgModel.length,
      ),
    );
  }
}
