import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/categories_model.dart';
import '../services/api_handler.dart';
import '../widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: FutureBuilder<List<CategoriesModel>>(
        future: APIHandler.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                 itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1.2),
                itemBuilder: ((context, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: const CategoryWidget());
                }),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occured due to $snapshot.error'),
            );
          } else {
            return const Center(
              child: Text('No products has been added yet'),
            );
          }
        },
      ),
    );
  }
}
