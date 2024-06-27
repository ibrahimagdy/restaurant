import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/core/widgets/custom_button.dart';

import '../../constants.dart';
import '../../view/home_screen/features/search_view.dart';
import '../utils/theme.dart';
import 'category_search_filter.dart';
import 'custom_text_form_field.dart';
import 'price_search_filter.dart';
import 'sort_by_search_filter.dart';

class CustomTopModalSheet extends StatefulWidget {
  final void Function()? onTap;
  final bool showDivider;
  final bool showTabs;

  const CustomTopModalSheet({
    super.key,
    this.onTap,
    this.showDivider = false,
    this.showTabs = true,
  });

  @override
  State<CustomTopModalSheet> createState() => _CustomTopModalSheetState();
}

class _CustomTopModalSheetState extends State<CustomTopModalSheet>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mediaQuery.height * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
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
            ),
            SizedBox(height: mediaQuery.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset("assets/icons/location_arrow.svg"),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery to",
                      style: theme().textTheme.labelSmall,
                    ),
                    Row(
                      children: [
                        Text(
                          "1014 Prospect Vall",
                          style: theme().textTheme.labelMedium,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset("assets/icons/filter_icon.svg"),
                        const SizedBox(width: 5),
                        Text('Filter', style: theme().textTheme.labelMedium),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            if (widget.showDivider)
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 0.5,
                ),
              ),
            if (widget.showTabs)
              Column(
                children: [
                  TabBar(
                    labelStyle: theme().textTheme.bodySmall,
                    labelPadding: const EdgeInsets.only(bottom: 10),
                    controller: tabController,
                    labelColor: primaryColor,
                    unselectedLabelColor: thirdColor,
                    indicatorColor: primaryColor,
                    tabs: const [
                      Tab(text: 'Category'),
                      Tab(text: 'Sort by'),
                      Tab(text: 'Price'),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.3,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        buildTabContent(const CategorySearchFilter()),
                        buildTabContent(const SortBySearchFilter()),
                        buildTabContent(const PriceSearchFilter()),
                      ],
                    ),
                  ),
                ],
              ),
            if (widget.showTabs)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomButton(buttonText: 'Complete'),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(Widget filterWidget) {
    return Column(
      children: [
        Expanded(child: SingleChildScrollView(child: filterWidget)),
      ],
    );
  }
}
