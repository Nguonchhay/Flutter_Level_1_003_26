// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String? id;
  String title;
  String description;
  String imageUrl;
  double price;

  ProductModel({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String?,
      title: map['name'] as String,
      description: map['shortDes'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] != null ? (map['price'] as num).toDouble() : 0.0,
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
