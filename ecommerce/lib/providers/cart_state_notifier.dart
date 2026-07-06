import 'package:ecommerce/models/cart_item_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartStateNotifier extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  void addItem(ProductModel product, {int qty = 1}) {
    _items.add(CartItemModel(product: product, quantity: qty));
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }
}
