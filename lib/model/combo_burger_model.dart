class ComboBurgerModel {
  final String headerName;
  final String image;
  final String name;
  final String price;
  final String type;

  ComboBurgerModel({
    required this.headerName,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });
}

final List<ComboBurgerModel> comboBgModel = [
  ComboBurgerModel(
    headerName: "Hot Burger Combo",
    image: "assets/images/bg_combo.png",
    name: "Combo Tender Grill",
    price: "\$ 10.15",
    type: "Burger combo",
  ),
  ComboBurgerModel(
    headerName: "Hot Burger Combo",
    image: "assets/images/bg_combo.png",
    name: "Combo Tender Grill",
    price: "\$ 10.15",
    type: "Burger combo",
  ),
  ComboBurgerModel(
    headerName: "Hot Burger Combo",
    image: "assets/images/bg_combo.png",
    name: "Combo Tender Grill",
    price: "\$ 10.15",
    type: "Burger combo",
  ),
];
