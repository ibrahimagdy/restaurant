import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/services/provider.dart';
import '../../../core/utils/theme.dart';

class DeliveryOrderDetails extends StatelessWidget {
  const DeliveryOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderModel>(
      builder: (context, orderModel, child) {
        if (orderModel.isOrderOngoing) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: SvgPicture.asset("assets/images/delivery_img.svg"),
                  title: Text("Delivering Your Order",
                      style: theme().textTheme.titleLarge),
                  subtitle: Text("Coming within 30 minutes",
                      style: theme()
                          .textTheme
                          .labelMedium!
                          .copyWith(color: thirdColor)),
                ),
                const Divider(thickness: 0.5, indent: 20, endIndent: 20),
                ListTile(
                  title: Text(
                    orderModel.ongoingOrderName!,
                    style: theme()
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Row(
                    children: [
                      Text('\$${orderModel.totalPrice.toStringAsFixed(2)}',
                          style: theme()
                              .textTheme
                              .labelMedium!
                              .copyWith(color: primaryColor)),
                      Text('   •  ${orderModel.quantity} items',
                          style: theme()
                              .textTheme
                              .labelSmall!
                              .copyWith(color: thirdColor)),
                      Text(
                        '   •  Credit Card',
                        style: theme()
                            .textTheme
                            .labelSmall!
                            .copyWith(color: thirdColor),
                      ),
                    ],
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 15),
                    child: Text(
                      "Details",
                      style: theme()
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
