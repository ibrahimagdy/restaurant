import 'package:flutter/material.dart';
import 'package:restaurant/view/home_screen/features/search_and_filter/custom_top_modal_sheet.dart';

class ShowTopSheet extends StatelessWidget {
  const ShowTopSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopModalSheet(
          onTap: () {
            Navigator.pop(context);
          },
          showDivider: true,
        ),
      ],
    );
  }
}
