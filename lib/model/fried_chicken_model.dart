class FriedChickenModel {
  final String headerName;
  final String image;
  final String name;
  final String price;
  final String type;

  FriedChickenModel({
    required this.headerName,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });
}

final List<FriedChickenModel> friedModel = [
  FriedChickenModel(
    headerName: "Fried Chicken",
    image: "assets/images/fried.png",
    name: "Combo Chicken Crispy",
    price: "\$ 10.15",
    type: "Burger combo",
  ),
  FriedChickenModel(
    headerName: "Fried Chicken",
    image: "assets/images/fried.png",
    name: "Combo Chicken Crispy",
    price: "\$ 10.15",
    type: "Burger combo",
  ),
  FriedChickenModel(
    headerName: "Fried Chicken",
    image: "assets/images/fried.png",
    name: "Combo Chicken Crispy",
    price: "\$ 10.15",
    type: "Burger combo",
  ),
];
