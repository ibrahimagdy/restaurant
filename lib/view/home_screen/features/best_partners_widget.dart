import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../core/functions/show_bottom_sheet.dart';
import '../../../core/utils/theme.dart';
import '../../../model/best_partners_model.dart';

class BestPartnersWidget extends StatelessWidget {
  const BestPartnersWidget({super.key});

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
                  'Best Partners',
                  style: theme()
                      .textTheme
                      .bodySmall!
                      .copyWith(color: secondaryColor),
                ),
                GestureDetector(
                  onTap: () => showAllPartners(context),
                  child: Text(
                    'See all',
                    style: theme()
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          SizedBox(height: mediaQuery.height * 0.02),
          SizedBox(
            height: mediaQuery.height * 0.33,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bestPartnerModel.length,
              itemBuilder: (context, index) {
                final partner = bestPartnerModel[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(partner.image),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(partner.name,
                                style: theme().textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            SvgPicture.asset("assets/icons/shield-check.svg"),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              partner.state,
                              style: theme().textTheme.labelSmall!.copyWith(
                                  color: partner.state == "Open"
                                      ? const Color(0xFF00875A)
                                      : Colors.red),
                            ),
                            const Text(" . "),
                            Text(partner.address,
                                style: theme()
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: thirdColor)),
                          ],
                        ),
                        SizedBox(height: mediaQuery.height * 0.013),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primaryColor,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.white, size: 16),
                                  const SizedBox(width: 4),
                                  Text(partner.rate,
                                      style: TextStyle(color: white)),
                                ],
                              ),
                            ),
                            const Text(" . "),
                            Text(partner.distance,
                                style: theme()
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: secondaryColor)),
                            const Text(" . "),
                            Text(partner.shipping,
                                style: theme()
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: secondaryColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
