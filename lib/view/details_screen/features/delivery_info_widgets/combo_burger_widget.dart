import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';

import '../../../../model/combo_burger_model.dart';

class ComboBurgerWidget extends StatelessWidget {
  final ComboBurgerModel item;

  const ComboBurgerWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: mediaQuery.width * 0.2,
              height: mediaQuery.height * 0.2,
              child: Image.asset(item.image, fit: BoxFit.cover),
            ),
          ),
          title: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme().textTheme.titleMedium,
          ),
          subtitle: Row(
            children: [
              Text(item.price, style: theme().textTheme.labelSmall),
              Text('  .  ${item.type}',
                  style:
                      theme().textTheme.labelSmall!.copyWith(color: thirdColor))
            ],
          ),
          trailing: Icon(Icons.star, color: primaryColor),
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }
}
