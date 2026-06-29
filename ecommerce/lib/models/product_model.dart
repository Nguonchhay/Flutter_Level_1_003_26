// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  int? id;
  String title;
  String description;
  String imageUrl;

  ProductModel({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['name'] as String,
      description: map['shortDes'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
