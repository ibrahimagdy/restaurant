import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/services/provider.dart';
import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_button.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orderModel = Provider.of<OrderModel>(context);

    return Container(
      color: white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(buttonText: 'Submit'),
          ),
        ],
      ),
    );
  }
}
