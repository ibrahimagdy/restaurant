import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/view/home_screen/features/best_partners_widget.dart';
import 'package:restaurant/view/home_screen/features/categories_container_widget.dart';

import 'features/search_filter_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondGreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchFilterWidget(),
            SizedBox(height: mediaQuery.height * 0.015),
            const CategoriesContainerWidget(),
            SizedBox(height: mediaQuery.height * 0.015),
            const BestPartnersWidget(),
            SizedBox(height: mediaQuery.height * 0.1),
          ],
        ),
      ),
    );
  }
}
