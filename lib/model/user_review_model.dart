class UserReviewModel {
  final String userImage;
  final String userName;
  final int userRate;
  final String rateTime;
  final String commentReview;
  final String likes;

  UserReviewModel({
    required this.userImage,
    required this.userName,
    required this.userRate,
    required this.rateTime,
    required this.commentReview,
    required this.likes,
  });
}

final List<UserReviewModel> userReviews = [
  UserReviewModel(
    userImage: "assets/images/user_review.png",
    userName: "Eleanor Summers",
    userRate: 5,
    rateTime: "Today, 16:40",
    commentReview:
        "What can I say it's fast food, it's Burger King.No different to any of the other burger kings, nice with adequate seating",
    likes: "68 likes",
  ),
  UserReviewModel(
    userImage: "assets/images/user_review.png",
    userName: "Victoria Champain",
    userRate: 4,
    rateTime: "Today, 16:40",
    commentReview:
        "Food, as always, is good both upstairs and downstairs is always clean (download the bk app for deals etc.) sit upstairs every time, more relaxed feel.",
    likes: "132 likes",
  ),
  UserReviewModel(
    userImage: "assets/images/user_review.png",
    userName: "Laura Smith",
    userRate: 3,
    rateTime: "Yesterday, 16:40",
    commentReview:
        "Amazing food. Lots of choice. We took a while to choose as everything sounded amazing on the menu! All cooked to perfection. Portions were large. Service excellent. Definitely plan to go again and often!",
    likes: "32 likes",
  ),
];
