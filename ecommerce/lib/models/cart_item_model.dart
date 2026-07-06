import 'package:ecommerce/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({required this.product, this.quantity = 1});

  double getTotal() {
    return product.price * quantity;
  }
}
