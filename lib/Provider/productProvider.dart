import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/productModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/Products/productsList.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];
  late SharedPreferences _prefs;

  List<ProductModel> get products => _products;

  ProductProvider() {
    _loadData();
  }

  void addProduct(ProductModel product) {
    _products.add(product);
    _saveData();
    notifyListeners();
  }

  void _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    String jsonData = _prefs.getString('products') ?? '[]';
    List<dynamic> decodedData = jsonDecode(jsonData);
    _products = decodedData.map((item) => ProductModel.fromJson(item)).toList();
    notifyListeners();
  }

  void _saveData() {
    String jsonData = jsonEncode(_products);
    _prefs.setString('products', jsonData);
  }
}
