import 'package:flutter/material.dart';

class OrderModel extends ChangeNotifier {
  int _quantity = 1;
  double _totalPrice = 0.0;
  double _pricePerItem = 0.0;

  int get quantity => _quantity;
  double get totalPrice => _totalPrice;
  double get pricePerItem => _pricePerItem;

  String? _ongoingOrderName;
  String? _restaurantName;
  String? _restaurantAddress;
  DateTime? _orderTime;
  bool _isOrderOngoing = false;

  String? get ongoingOrderName => _ongoingOrderName;

  String? get restaurantName => _restaurantName;

  String? get restaurantAddress => _restaurantAddress;

  DateTime? get orderTime => _orderTime;

  bool get isOrderOngoing => _isOrderOngoing;

  void initialize(int quantity, double totalPrice) {
    _quantity = quantity;
    _totalPrice = totalPrice;
    _pricePerItem = totalPrice / quantity;
    notifyListeners();
  }

  void updateQuantity(int newQuantity) {
    _quantity = newQuantity;
    _totalPrice = _pricePerItem * newQuantity;
    notifyListeners();
  }

  void startOngoingOrder(String orderName, String restaurantName,
      String restaurantAddress, DateTime orderTime) {
    _ongoingOrderName = orderName;
    _restaurantName = restaurantName;
    _restaurantAddress = restaurantAddress;
    _orderTime = DateTime.now();
    _isOrderOngoing = true;
    notifyListeners();
  }

  void resetOngoingOrder() {
    _ongoingOrderName = null;
    _restaurantName = null;
    _restaurantAddress = null;
    _orderTime = null;
    _isOrderOngoing = false;
    notifyListeners();
  }
}
