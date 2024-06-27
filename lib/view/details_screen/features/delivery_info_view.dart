import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/model/combo_burger_model.dart';
import 'package:restaurant/model/fried_chicken_model.dart';
import 'package:restaurant/view/details_screen/features/delivery_info_widgets/popular_items_widget.dart';

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
          const SliverToBoxAdapter(child: PopularItemsWidget()),
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
          const SliverToBoxAdapter(child: ComboBurgerWidget()),
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
          const SliverToBoxAdapter(child: FriedChickenWidget()),
        ],
      ),
    );
  }
}
