import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/theme.dart';
import '../../../../model/popular_items_model.dart';

class PopularItemsWidget extends StatelessWidget {
  final PopularItemsModel item;

  const PopularItemsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: mediaQuery.width * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item.image),
            SizedBox(height: mediaQuery.height * 0.01),
            Text(
              item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  theme().textTheme.bodyLarge!.copyWith(color: secondaryColor),
            ),
            SizedBox(height: mediaQuery.height * 0.005),
            Row(
              children: [
                Text(
                  item.price,
                  style: theme()
                      .textTheme
                      .labelMedium!
                      .copyWith(color: const Color(0xFF00875A)),
                ),
                SizedBox(width: mediaQuery.width * 0.01),
                Text(
                  "  .  ${item.type}",
                  style:
                      theme().textTheme.labelSmall!.copyWith(color: thirdColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
