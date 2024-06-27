import 'package:flutter/material.dart';

import '../../../../model/user_review_model.dart';
import 'review_widget.dart';

class UsersReview extends StatelessWidget {
  const UsersReview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      itemCount: userReviews.length,
      itemBuilder: (context, index) {
        return ReviewWidget(review: userReviews[index]);
      },
    );
  }
}
