import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/category_model.dart';
import '../utils/theme.dart';

class CategorySearchFilter extends StatelessWidget {
  const CategorySearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categoryModel.length, (index) {
          final category = categoryModel[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(category.categoryImage),
                const SizedBox(height: 10),
                Text(
                  category.categoryName,
                  style: theme().textTheme.labelMedium,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
