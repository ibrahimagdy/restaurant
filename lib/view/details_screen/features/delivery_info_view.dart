import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/model/combo_burger_model.dart';
import 'package:restaurant/model/fried_chicken_model.dart';
import 'package:restaurant/view/details_screen/features/delivery_info_lists/combo_burger_list.dart';
import 'package:restaurant/view/details_screen/features/delivery_info_lists/fried_chicken_list.dart';
import 'package:restaurant/view/details_screen/features/delivery_info_lists/popular_items_list.dart';

import '../../../model/best_partners_model.dart';

class DeliveryInfoView extends StatelessWidget {
  final BestPartnersModel restaurant;

  const DeliveryInfoView({super.key, required this.restaurant});

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
            child: SizedBox(
              height: mediaQuery.height * 0.27,
              child: PopularItemsList(restaurant: restaurant),
            ),
          ),
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
          ComboBurgerList(restaurant: restaurant),
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
          FriedChickenList(restaurant: restaurant),
        ],
      ),
    );
  }
}
