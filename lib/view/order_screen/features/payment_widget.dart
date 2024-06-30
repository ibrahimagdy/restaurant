import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/functions/show_cash_payment_dialog.dart';
import '../../../core/functions/show_payment_bottom_sheet.dart';
import '../../../core/services/provider.dart';
import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_button.dart';

class PaymentWidget extends StatefulWidget {
  final Map<String, dynamic> args;

  const PaymentWidget({super.key, required this.args});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  bool isCashSelected = false;

  @override
  Widget build(BuildContext context) {
    final orderModel = Provider.of<OrderModel>(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showPaymentBottomSheet(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFFFEBE5).withOpacity(0.4),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset("assets/icons/paypal_icon.svg"),
                      title: Text(
                        '\$ ${orderModel.totalPrice.toStringAsFixed(2)}',
                        style: theme()
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: primaryColor),
                      ),
                      subtitle: Text(
                        "Paypal",
                        style: theme()
                            .textTheme
                            .labelMedium!
                            .copyWith(color: primaryColor.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCashSelected = !isCashSelected;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: isCashSelected
                          ? Border.all(color: thirdColor, width: 1)
                          : null,
                      color: const Color(0xFFF4F5F7),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset("assets/icons/cash_icon.svg"),
                      title: Text(
                        '\$ ${orderModel.totalPrice.toStringAsFixed(2)}',
                        style: theme()
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: secondaryColor),
                      ),
                      subtitle: Text(
                        "Cash",
                        style: theme()
                            .textTheme
                            .labelMedium!
                            .copyWith(color: thirdColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              buttonText: 'Submit',
              onTap: () {
                orderModel.startOngoingOrder(
                  widget.args['name'] ?? '',
                  widget.args['partnerName'] ?? '',
                  widget.args['partnerAddress'] ?? '',
                  DateTime.now(),
                );
                showCashPaymentDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}