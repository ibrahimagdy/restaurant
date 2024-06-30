import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/services/provider.dart';
import '../../../core/utils/theme.dart';

class ResetInvoiceWidget extends StatefulWidget {
  final Map<String, dynamic> args;

  const ResetInvoiceWidget({super.key, required this.args});

  @override
  State<ResetInvoiceWidget> createState() => _ResetInvoiceWidgetState();
}

class _ResetInvoiceWidgetState extends State<ResetInvoiceWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final orderModel = Provider.of<OrderModel>(context, listen: false);
      orderModel.initialize(widget.args['quantity'], widget.args['totalPrice']);
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderModel = Provider.of<OrderModel>(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  widget.args['partnerName'],
                  style: theme().textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 10),
            child: ListTile(
              leading: Image.asset(widget.args['confirmOrderImage']),
              title: Text(
                widget.args['name'],
                style: theme().textTheme.labelSmall!.copyWith(
                    color: secondaryColor, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (orderModel.quantity > 1) {
                              orderModel
                                  .updateQuantity(orderModel.quantity - 1);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: thirdColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(orderModel.quantity.toString()),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            orderModel.updateQuantity(orderModel.quantity + 1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      '\$ ${orderModel.totalPrice.toStringAsFixed(2)}',
                      style: theme()
                          .textTheme
                          .labelMedium!
                          .copyWith(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal (${orderModel.quantity} items)',
                  style: theme().textTheme.labelMedium,
                ),
                Text("\$${orderModel.totalPrice.toStringAsFixed(2)}")
              ],
            ),
          ),
          const Divider(thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: theme().textTheme.labelMedium,
                ),
                const Text("\$ 0.00")
              ],
            ),
          ),
          const Divider(thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Voucher',
                  style: theme().textTheme.labelMedium,
                ),
                const Text("-")
              ],
            ),
          ),
          const Divider(thickness: 0.5),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 12, bottom: 15, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: theme()
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: secondaryColor),
                ),
                Text(
                  "\$${orderModel.totalPrice.toStringAsFixed(2)}",
                  style: theme()
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: primaryColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
