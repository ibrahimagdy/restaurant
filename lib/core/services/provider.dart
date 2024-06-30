import 'package:flutter/material.dart';

class OrderModel extends ChangeNotifier {
  int _quantity = 1;
  double _totalPrice = 0.0;
  double _pricePerItem = 0.0;

  int get quantity => _quantity;

  double get totalPrice => _totalPrice;

  double get pricePerItem => _pricePerItem;

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
}
