import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/theme.dart';

class PriceSearchFilter extends StatefulWidget {
  const PriceSearchFilter({super.key});

  @override
  State<PriceSearchFilter> createState() => _PriceSearchFilterState();
}

class _PriceSearchFilterState extends State<PriceSearchFilter> {
  RangeValues currentRangeValues = const RangeValues(5, 100);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Max Delivery Fee',
            style: theme().textTheme.labelMedium,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: greyColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ 5.00",
                        style: theme().textTheme.bodySmall,
                      ),
                      Text(
                        "\$ 10.00",
                        style: theme().textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: RangeSlider(
                    activeColor: primaryColor,
                    values: currentRangeValues,
                    max: 100,
                    min: 5,
                    divisions: 10,
                    labels: RangeLabels(
                      currentRangeValues.start.round().toString(),
                      currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        currentRangeValues = values;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
