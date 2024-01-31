import 'package:flutter/material.dart';

class OrderHistoryProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _orderItems = [];

  List<Map<String, dynamic>> get orderItems => _orderItems;

  void addToOrderHistory(Map<String, dynamic> product) {
    _orderItems.add(product);
    notifyListeners();

    print(_orderItems);
  }
}
