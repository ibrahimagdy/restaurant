import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';

import '../../../../model/combo_burger_model.dart';

class ComboBurgerWidget extends StatelessWidget {
  const ComboBurgerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        for (int i = 0; i < comboBgModel.length; i++) ...[
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: mediaQuery.width * 0.2,
                height: mediaQuery.height * 0.2,
                child: Image.asset(comboBgModel[i].image, fit: BoxFit.cover),
              ),
            ),
            title: Text(
              comboBgModel[i].name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme().textTheme.titleMedium,
            ),
            subtitle: Row(
              children: [
                Text(comboBgModel[i].price,
                    style: theme().textTheme.labelSmall),
                Text('  .  ${comboBgModel[i].type}',
                    style: theme()
                        .textTheme
                        .labelSmall!
                        .copyWith(color: thirdColor))
              ],
            ),
            trailing: Icon(Icons.star, color: primaryColor),
          ),
          if (i < comboBgModel.length - 1) const Divider(thickness: 0.5),
        ]
      ],
    );
  }
}