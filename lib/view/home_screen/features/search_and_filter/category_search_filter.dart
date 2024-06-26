import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/theme.dart';

class CategorySearchFilter extends StatelessWidget {
  const CategorySearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset("assets/icons/sandwich.svg"),
            const SizedBox(height: 10),
            Text(
              'Sandwich',
              style: theme().textTheme.labelMedium,
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset("assets/icons/pizaa.svg"),
            const SizedBox(height: 10),
            Text(
              'Pizaa',
              style: theme().textTheme.labelMedium,
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset("assets/icons/burgers.svg"),
            const SizedBox(height: 10),
            Text(
              'Burgers',
              style: theme().textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}
