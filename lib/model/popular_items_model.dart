class PopularItemsModel {
  final String image;
  final String name;
  final String price;
  final String type;
  final String subtitle;
  final String orderImage;

  PopularItemsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.type,
    required this.subtitle,
    required this.orderImage,
  });
}

final List<PopularItemsModel> popularItems = [
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
];
