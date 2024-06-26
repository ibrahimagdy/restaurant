import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';

import 'features/search_and_filter/search_filter_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: greyColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchFilterWidget(),
          ],
        ),
      ),
    );
  }
}
