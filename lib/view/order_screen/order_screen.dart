import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/view/order_screen/features/add_voucher_widget.dart';
import 'package:restaurant/view/order_screen/features/delivery_location_widget.dart';
import 'package:restaurant/view/order_screen/features/payment_widget.dart';
import 'package:restaurant/view/order_screen/features/reset_invoice_widget.dart';

class OrderScreen extends StatelessWidget {
  static const String id = 'OrderScreen';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: secondGreyColor,
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Confirm Order", style: theme().textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mediaQuery.height * 0.01),
            const DeliveryLocationWidget(),
            SizedBox(height: mediaQuery.height * 0.01),
            ResetInvoiceWidget(args: args),
            SizedBox(height: mediaQuery.height * 0.01),
            const AddVoucherWidget(),
            SizedBox(height: mediaQuery.height * 0.01),
            PaymentWidget(args: args),
            Container(
              color: white,
              height: mediaQuery.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}