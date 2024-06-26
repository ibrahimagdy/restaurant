import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/theme.dart';
import '../../../core/widgets/category_search_filter.dart';

class CategoriesContainerWidget extends StatelessWidget {
  const CategoriesContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, bottom: 18, top: 22, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: theme()
                      .textTheme
                      .bodySmall!
                      .copyWith(color: secondaryColor),
                ),
                Text(
                  'See all',
                  style: theme()
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          const CategorySearchFilter(),
          SizedBox(height: mediaQuery.height * 0.03),
        ],
      ),
    );
  }
}
