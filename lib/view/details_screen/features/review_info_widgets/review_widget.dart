import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';

import '../../../../core/utils/theme.dart';
import '../../../../model/user_review_model.dart';

class ReviewWidget extends StatelessWidget {
  final UserReviewModel review;

  const ReviewWidget({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(review.userImage),
              radius: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.userName,
                    style: theme().textTheme.labelMedium,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < review.userRate
                            ? primaryColor
                            : Colors.grey,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ),
            Text(
              review.rateTime,
              style: theme().textTheme.labelSmall!.copyWith(color: thirdColor),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          review.commentReview,
          style: theme()
              .textTheme
              .labelMedium!
              .copyWith(color: secondaryColor, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.favorite,
              color: primaryColor,
              size: 16,
            ),
            const SizedBox(width: 5),
            Text(
              review.likes,
              style: theme().textTheme.labelSmall!.copyWith(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 0.5),
        const SizedBox(height: 10),
      ],
    );
  }
}
