import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../view/home_screen/features/search_view.dart';
import 'custom_text_form_field.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SearchScreen.id);
        },
        child: AbsorbPointer(
          child: CustomTextFormField(
            context: context,
            controller: searchController,
            hintText: 'Search on Coody',
            prefixIcon: SvgPicture.asset(
              "assets/icons/address_icon.svg",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
