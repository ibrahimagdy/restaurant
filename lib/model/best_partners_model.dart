class BestPartnersModel {
  final String image;
  final String name;
  final String state;
  final String address;
  final String rate;
  final String distance;
  final String shipping;

  BestPartnersModel({
    required this.image,
    required this.name,
    required this.state,
    required this.address,
    required this.rate,
    required this.distance,
    required this.shipping,
  });
}

final List<BestPartnersModel> bestPartnerModel = [
  BestPartnersModel(
    image: "assets/images/subway.png",
    name: "Subway",
    state: "Open",
    address: "Santa Nella, CA 95322",
    rate: "4.5",
    distance: "1.5 km",
    shipping: "Free shipping",
  ),
  BestPartnersModel(
    image: "assets/images/taco_bell.png",
    name: "Taco Bell",
    state: "Open",
    address: "Santa Nella, CA 95322",
    rate: "4.5",
    distance: "0.2 km",
    shipping: "Free shipping",
  ),
  BestPartnersModel(
    image: "assets/images/burger_king.png",
    name: "Burger King",
    state: "Close",
    address: "Santa Nella, CA 95322",
    rate: "4.8",
    distance: "2.6 km",
    shipping: "Free shipping",
  ),
  BestPartnersModel(
    image: "assets/images/kfc.png",
    name: "KFC",
    state: "Open",
    address: "Santa Nella, CA 95322",
    rate: "4.0",
    distance: "3.0 km",
    shipping: "Free shipping",
  ),
];
