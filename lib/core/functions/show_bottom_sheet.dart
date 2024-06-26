import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../model/best_partners_model.dart';
import '../utils/theme.dart';

void showAllPartners(BuildContext context) {
  var mediaQuery = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: mediaQuery.height * 0.9,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Best Partners',
                style: theme().textTheme.headlineSmall!.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              const Divider(thickness: 0.5),
              Expanded(
                child: ListView.builder(
                  itemCount: bestPartnerModel.length,
                  itemBuilder: (context, index) {
                    final partner = bestPartnerModel[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: mediaQuery.width,
                                child: Image.asset(partner.image,
                                    fit: BoxFit.cover),
                              ),
                            ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
