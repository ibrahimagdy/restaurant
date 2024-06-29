import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/theme.dart';

import '../../constants.dart';
import '../widgets/custom_button.dart';

void showOrderBottomSheet(BuildContext context, String name, String subtitle,
    String orderImage, String price) {
  var mediaQuery = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      int quantity = 1;
      double totalPrice = double.parse(price.substring(1));
      String selectedSize = 'M';

      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: mediaQuery.height * 0.95,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: theme().textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: mediaQuery.height * 0.01),
                      Text(
                        subtitle,
                        style: theme()
                            .textTheme
                            .labelSmall!
                            .copyWith(color: thirdColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    orderImage,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ['S', 'M', 'L'].map((size) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedSize == size
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          size,
                          style: theme().textTheme.headlineSmall!.copyWith(
                                color: selectedSize == size
                                    ? Colors.white
                                    : primaryColor,
                              ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: mediaQuery.height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF0B3),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Color(0xFFFF8B00)),
                        onPressed: () {
                          setState(() {
                            quantity++;
                            totalPrice =
                                double.parse(price.substring(1)) * quantity;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 40),
                    Text(
                      quantity.toString(),
                      style: theme().textTheme.titleLarge,
                    ),
                    const SizedBox(width: 40),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF0B3),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon:
                            const Icon(Icons.remove, color: Color(0xFFFF8B00)),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                              totalPrice =
                                  double.parse(price.substring(1)) * quantity;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, left: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: theme().textTheme.headlineSmall,
                          ),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: theme()
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CustomButton(
                            buttonText: "Add to Order",
                            onTap: () {
                              Navigator.pushNamed(context, '');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
