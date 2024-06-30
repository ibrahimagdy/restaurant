import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/services/provider.dart';
import 'package:restaurant/view/ongoing_screen/features/no_order_receive.dart';

import '../../../core/utils/theme.dart';

class DeliveryDestinationDetails extends StatelessWidget {
  const DeliveryDestinationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Consumer<OrderModel>(
      builder: (context, orderModel, child) {
        if (orderModel.isOrderOngoing) {
          final orderTimeFormatted = orderModel.orderTime != null
              ? DateFormat('hh:mm a').format(orderModel.orderTime!)
              : 'N/A';
          final orderTimePlus30Minutes = orderModel.orderTime != null
              ? DateFormat('hh:mm a').format(
                  orderModel.orderTime!.add(const Duration(minutes: 30)))
              : 'N/A';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/distantion.svg"),
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '${orderModel.restaurantName} - ${orderModel.restaurantAddress}',
                                style: theme().textTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                'Restaurant   •   $orderTimeFormatted',
                                style: theme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: thirdColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'You - 49th St Los Angeles, California',
                                style: theme().textTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                'Home   •   $orderTimePlus30Minutes',
                                style: theme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: thirdColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Image.asset("assets/images/delivery_profile.png"),
                  title: Text(
                    'Philippe Troussier',
                    style: theme().textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    'Delivery  •  0145425765',
                    style: theme()
                        .textTheme
                        .labelSmall!
                        .copyWith(color: thirdColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                  trailing: SizedBox(
                    width: mediaQuery.width * 0.25,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/call_icon.svg"),
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset("assets/icons/message_icon.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const NoOrderReceive();
        }
      },
    );
  }
}
