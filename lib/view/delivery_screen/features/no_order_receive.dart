import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/theme.dart';
import '../../home_layout/home_layout.dart';

class NoOrderReceive extends StatelessWidget {
  const NoOrderReceive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: white),
      child: Column(
        children: [
          Text(
            'No order until this moment,\n Go to make your order',
            style: theme().textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeLayout.id);
            },
            child: Text(
              'KEEP BROWSING',
              style:
                  theme().textTheme.labelMedium!.copyWith(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
