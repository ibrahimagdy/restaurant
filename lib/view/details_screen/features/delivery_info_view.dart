import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/model/combo_burger_model.dart';
import 'package:restaurant/model/fried_chicken_model.dart';
import 'package:restaurant/view/details_screen/features/delivery_info_widgets/popular_items_widget.dart';

import '../../../core/functions/show_order_bottom_sheet.dart';
import '../../../model/popular_items_model.dart';
import 'delivery_info_widgets/combo_burger_widget.dart';
import 'delivery_info_widgets/fried_chicken_widget.dart';

class DeliveryInfoView extends StatelessWidget {
  const DeliveryInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text('Popular Items', style: theme().textTheme.titleLarge),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.02)),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
                final item = popularItems[0];
                showOrderBottomSheet(context, item.name, item.subtitle,
                    item.orderImage, item.price);
              },
              child: PopularItemsWidget(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.02)),
          const SliverToBoxAdapter(child: Divider(thickness: 0.5)),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.02)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(comboBgModel[0].headerName,
                    style: theme().textTheme.titleLarge),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.01)),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
                final item = comboBgModel[0];
                showOrderBottomSheet(context, item.name, item.subtitle,
                    item.orderImage, item.price);
              },
              child: ComboBurgerWidget(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.02)),
          const SliverToBoxAdapter(child: Divider(thickness: 0.5)),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.02)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(friedModel[0].headerName,
                    style: theme().textTheme.titleLarge),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: mediaQuery.height * 0.01)),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
                final item = friedModel[0];
                showOrderBottomSheet(context, item.name, item.subtitle,
                    item.orderImage, item.price);
              },
              child: FriedChickenWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
