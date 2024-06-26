import 'package:flutter/material.dart';
import 'package:restaurant/view/home_screen/features/search_and_filter/custom_top_modal_sheet.dart';
import 'package:restaurant/view/home_screen/features/search_and_filter/show_top_sheet.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTopModalSheet(
      onTap: () {
        showTopModalSheet(
          context,
          const ShowTopSheet(),
        );
      },
      showTabs: false,
    );
  }
}
