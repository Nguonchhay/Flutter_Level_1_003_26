import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartStateNotifier extends ChangeNotifier {
  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);

    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _products.removeWhere((p) => p.id == product.id);

    notifyListeners();
  }
}
