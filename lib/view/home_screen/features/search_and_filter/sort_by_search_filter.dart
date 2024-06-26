import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../core/utils/theme.dart';

class SortBySearchFilter extends StatefulWidget {
  const SortBySearchFilter({super.key});

  @override
  State<SortBySearchFilter> createState() => _SortBySearchFilterState();
}

class _SortBySearchFilterState extends State<SortBySearchFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildListTile("assets/icons/recommended_icon.svg", "Recommended", 0),
        buildListTile(
            "assets/icons/fast_delivery_icon.svg", "Fastest Delivery", 1),
        buildListTile("assets/icons/most_popular_icon.svg", "Most Popular", 2),
      ],
    );
  }

  Widget buildListTile(String iconPath, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: greyColor,
        ),
        child: ListTile(
          leading: SvgPicture.asset(iconPath),
          title: Text(
            title,
            style: theme().textTheme.labelMedium,
          ),
          trailing: selectedIndex == index
              ? Icon(Icons.check_circle, color: thirdColor)
              : null,
        ),
      ),
    );
  }
}
