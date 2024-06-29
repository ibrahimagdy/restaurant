class ComboBurgerModel {
  final String headerName;
  final String image;
  final String name;
  final String price;
  final String type;
  final String subtitle;
  final String orderImage;

  ComboBurgerModel({
    required this.headerName,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
    required this.subtitle,
    required this.orderImage,
  });
}

final List<ComboBurgerModel> comboBgModel = [
  ComboBurgerModel(
    headerName: "Hot Burger Combo",
    image: "assets/images/bg_combo.png",
    name: "Combo Spicy Tender",
    price: "\$ 10.15",
    type: "Burger combo",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  ComboBurgerModel(
    headerName: "Hot Burger Combo",
    image: "assets/images/bg_combo.png",
    name: "Combo Tender Grill",
    price: "\$ 10.15",
    type: "Burger combo",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
  ComboBurgerModel(
    headerName: "Combo BBQ Bacon",
    image: "assets/images/bg_combo.png",
    name: "Combo Tender Grill",
    price: "\$ 10.15",
    type: "Burger combo",
    subtitle: "A signature flame-grilled beef patty\ntopped with smoked bacon.",
    orderImage: "assets/images/order_image.png",
  ),
];
