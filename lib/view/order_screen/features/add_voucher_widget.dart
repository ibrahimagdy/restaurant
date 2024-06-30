import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/theme.dart';

class AddVoucherWidget extends StatelessWidget {
  const AddVoucherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
      ),
      child: ListTile(
        leading: Icon(Icons.percent, color: primaryColor, size: 26),
        title: Text(
          'Add Voucher',
          style: theme()
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFEBE5).withOpacity(0.3),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Text("Add", style: TextStyle(color: primaryColor)),
        ),
      ),
    );
  }
}
