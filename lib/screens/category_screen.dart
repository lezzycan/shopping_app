import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
           mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return const CategoryWidget();
          }),
         
        ) )) ;
        
        
    
  }
}
