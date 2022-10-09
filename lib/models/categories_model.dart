import 'package:flutter/widgets.dart';
import 'package:grocery_app/services/api_handler.dart';

class CategoriesModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;

  CategoriesModel({this.id, this.name, this.image});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  static List<CategoriesModel> fromCategoriesJson(List categoryJson) {
    return categoryJson.map((data) {
      return CategoriesModel.fromJson(data);
    }).toList();
  }

 
}
