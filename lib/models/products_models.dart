import 'package:flutter/material.dart';
import 'package:grocery_app/models/categories_model.dart';

class ProductsModel with ChangeNotifier{
  int? id;
  String? title;
  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;

  ProductsModel(
      {  this.id,
      this.title,
      this.price,
      this.description,
      this.category,
     required this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['images'] = images;
    return data;
  }

// Reading the jsonData and transform them to productsModel
// And create a list of the productsModel
  static List<ProductsModel> productsFromJson(List productsJson) {
    return productsJson.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
