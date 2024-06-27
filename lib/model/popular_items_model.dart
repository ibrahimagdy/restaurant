class PopularItemsModel {
  final String image;
  final String name;
  final String price;
  final String type;

  PopularItemsModel({
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });
}

final List<PopularItemsModel> popularItems = [
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
  ),
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
  ),
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
  ),
  PopularItemsModel(
    image: "assets/images/popular_image.png",
    name: "Extreme cheese whopper JR",
    price: "\$ 5.99",
    type: "Burger",
  ),
];
