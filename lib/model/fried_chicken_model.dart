class FriedChickenModel {
  final String headerName;
  final String image;
  final String name;
  final String price;
  final String type;
  final String subtitle;
  final String orderImage;

  FriedChickenModel({
    required this.headerName,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
    required this.subtitle,
    required this.orderImage,
  });
}

final List<FriedChickenModel> friedModel = [
  FriedChickenModel(
    headerName: "Fried Chicken",
    image: "assets/images/fried.png",
    name: "Combo Chicken Crispy",
    price: "\$ 10.15",
    type: "Burger combo",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  FriedChickenModel(
    headerName: "Fried Chicken",
    image: "assets/images/fried.png",
    name: "Combo Chicken Crispy",
    price: "\$ 10.15",
    type: "Burger combo",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  FriedChickenModel(
    headerName: "Fried Chicken",
    image: "assets/images/fried.png",
    name: "Combo Chicken Crispy",
    price: "\$ 10.15",
    type: "Burger combo",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
];
