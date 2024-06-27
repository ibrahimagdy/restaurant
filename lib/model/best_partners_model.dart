import 'package:restaurant/view/details_screen/details_screen.dart';

import 'menu_model.dart';

class BestPartnersModel {
  final String image;
  final String name;
  final String state;
  final String address;
  final String rate;
  final String distance;
  final String shipping;
  List<MenuItem> menuItems;
  final String onTap;
  final String time;

  BestPartnersModel({
    required this.image,
    required this.name,
    required this.state,
    required this.address,
    required this.rate,
    required this.distance,
    required this.shipping,
    required this.menuItems,
    required this.onTap,
    required this.time,
  });
}

final List<BestPartnersModel> bestPartnerModel = [
  BestPartnersModel(
    image: "assets/images/burger_king.png",
    name: "Burger King",
    state: "Open",
    address: "Santa Nella, CA 95322",
    rate: "4.8",
    distance: "2.6 km",
    shipping: "Free shipping",
    time: "15 Mins",
    onTap: DetailsScreen.id,
    menuItems: [
      MenuItem(
        itemName: "Burger King",
        itemImage: "assets/images/bk_1.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Burger King",
        itemImage: "assets/images/bk_2.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Burger King",
        itemImage: "assets/images/bk_3.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Burger King",
        itemImage: "assets/images/bk_4.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Burger King",
        itemImage: "assets/images/bk_5.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Burger King",
        itemImage: "assets/images/bk_6.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
    ],
  ),
  BestPartnersModel(
    image: "assets/images/taco_bell.png",
    name: "Taco Bell",
    state: "Close",
    address: "Santa Nella, CA 95322",
    rate: "4.5",
    distance: "0.2 km",
    shipping: "Free shipping",
    time: "15 Mins",
    onTap: DetailsScreen.id,
    menuItems: [
      MenuItem(
        itemName: "Taco Bell",
        itemImage: "assets/images/bk_1.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Taco Bell",
        itemImage: "assets/images/bk_2.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Taco Bell",
        itemImage: "assets/images/bk_3.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Taco Bell",
        itemImage: "assets/images/bk_4.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Taco Bell",
        itemImage: "assets/images/bk_5.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Taco Bell",
        itemImage: "assets/images/bk_6.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
    ],
  ),
  BestPartnersModel(
    image: "assets/images/subway.png",
    name: "Subway",
    state: "Open",
    address: "Santa Nella, CA 95322",
    rate: "4.5",
    distance: "1.5 km",
    shipping: "Free shipping",
    time: "15 Mins",
    onTap: DetailsScreen.id,
    menuItems: [
      MenuItem(
        itemName: "Subway",
        itemImage: "assets/images/bk_1.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Subway",
        itemImage: "assets/images/bk_2.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Subway",
        itemImage: "assets/images/bk_3.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Subway",
        itemImage: "assets/images/bk_4.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Subway",
        itemImage: "assets/images/bk_5.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "Subway",
        itemImage: "assets/images/bk_6.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
    ],
  ),
  BestPartnersModel(
    image: "assets/images/kfc.png",
    name: "KFC",
    state: "Open",
    address: "Santa Nella, CA 95322",
    rate: "4.0",
    distance: "3.0 km",
    shipping: "Free shipping",
    time: "15 Mins",
    onTap: DetailsScreen.id,
    menuItems: [
      MenuItem(
        itemName: "KFC",
        itemImage: "assets/images/bk_1.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "KFC",
        itemImage: "assets/images/bk_2.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "KFC",
        itemImage: "assets/images/bk_3.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "KFC",
        itemImage: "assets/images/bk_4.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "KFC",
        itemImage: "assets/images/bk_5.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
      MenuItem(
        itemName: "KFC",
        itemImage: "assets/images/bk_6.png",
        itemType: "Food",
        itemPrice: "2.5 USD",
      ),
    ],
  ),
];
