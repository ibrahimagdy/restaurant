import 'package:flutter/material.dart';
import 'package:restaurant/core/widgets/custom_top_modal_sheet.dart';
import 'package:restaurant/core/widgets/show_top_sheet.dart';
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
