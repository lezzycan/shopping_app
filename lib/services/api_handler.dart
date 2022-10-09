import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:grocery_app/consts/api.dart';
import 'package:grocery_app/models/products_models.dart';
// ignore: depend_on_referenced_packages
import "package:http/http.dart" as http;

import '../models/categories_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData(String target) async {
    var url = Uri.http(BASE_URL, 'api/v1/$target');
    var response = await http.get(url);
    var datas = jsonDecode(response.body);
    var dataList = [];
    for (var data in datas) {
      dataList.add(data);
    }
    return dataList;
  }

  static Future<List<ProductsModel>> getProducts() async {
    var productsList = await getData('products');
    return ProductsModel.productsFromJson(productsList);
  }

  static Future<List<CategoriesModel>> getCategories() async {
    var categoriesList = await getData('categories');
    return CategoriesModel.fromCategoriesJson(categoriesList);
    //   var url = Uri.http(CATEGORIES_BASE_URL, 'api/v1/categories');
    //   var response = await http.get(url);
    //   var data = jsonDecode(response.body);
    //   var categoryList = [];
    //   for (var value in data) {
    //     categoryList.add(value);
    //   }
    //   return CategoriesModel.fromCategoriesJson(categoryList);
    // }
  }
}
