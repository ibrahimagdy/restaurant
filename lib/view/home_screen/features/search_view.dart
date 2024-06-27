import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/core/widgets/custom_text_form_field.dart';
import 'package:restaurant/model/best_partners_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<BestPartnersModel> displayedPartners = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterPartners);
  }

  void _filterPartners() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        displayedPartners = [];
      } else {
        displayedPartners = bestPartnerModel.where((partner) {
          bool matchesPartner = partner.name.toLowerCase().contains(query);
          if (matchesPartner) {
            partner.menuItems = partner.menuItems
                .where((menuItem) =>
                    menuItem.itemName.toLowerCase().contains(query))
                .toList();
          }
          return matchesPartner;
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextFormField(
              context: context,
              controller: searchController,
              hintText: 'Search on Coody',
              prefixIcon: SvgPicture.asset(
                "assets/icons/address_icon.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(height: 10),
            if (displayedPartners.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: displayedPartners.length,
                  itemBuilder: (context, partnerIndex) {
                    final partner = displayedPartners[partnerIndex];
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: partner.menuItems.length,
                      itemBuilder: (context, menuItemIndex) {
                        final menuItem = partner.menuItems[menuItemIndex];
                        return ListTile(
                          leading: Image.asset(menuItem.itemImage),
                          title: Text(menuItem.itemName),
                          subtitle: Row(
                            children: [
                              Text(
                                '${menuItem.itemPrice} ',
                                style: theme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                '. ${menuItem.itemType}',
                                style: theme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: thirdColor),
                              ),
                            ],
                          ),
                          trailing: Icon(
                            Icons.star,
                            color: primaryColor,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
