import 'dart:convert';
import 'package:grocery_app/consts/api.dart';
import 'package:grocery_app/models/products_models.dart';
import 'package:grocery_app/models/users_model.dart';
// ignore: depend_on_referenced_packages
import "package:http/http.dart" as http;
import '../models/categories_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String source, String? limit}) async {
    try {
      var url = Uri.http(BASE_URL, 'api/v1/$source',
          source== "products" ? {"offset": 0, "limit": limit} : {});
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }
      var dataList = [];
      for (var data in data) {
        dataList.add(data);
      }
      return dataList;
    } catch (error) {
      // log('An error occurred $error');
      throw '$error';
    }
  }

  static Future<List<ProductsModel>> getProducts({required String limit}) async {
    var productsList = await getData( source:'products', limit: limit);
    return ProductsModel.productsFromJson(productsList);
  }

  static Future<List<CategoriesModel>> getCategories() async {
    var categoriesList = await getData(source: 'categories');
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

  static Future<List<UsersModel>> getUsers() async {
    var listOfUsers = await getData(source :'users');
    return UsersModel.usersFromJson(listOfUsers);
  }

  static Future<ProductsModel> getProductById(String id) async {
    try {
      var url = Uri.http(BASE_URL, 'api/v1/products/$id');
      var response = await http.get(url);
      var data = jsonDecode(response.body);

      return ProductsModel.fromJson(data);
    } catch (error) {
      throw error.toString();
    }
  }
}
