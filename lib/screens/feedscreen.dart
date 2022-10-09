import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products_models.dart';
import '../services/api_handler.dart';
import '../widgets/feeds_widget.dart';

class FeedScreenState extends StatefulWidget {
  const FeedScreenState({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedScreenState> createState() => _FeedScreenStateState();
}

class _FeedScreenStateState extends State<FeedScreenState> {
  List<ProductsModel> productsList = [];
  @override
  void didChangeDependencies() {
    getAllProducts();
    // APIHandler.getProducts();
    super.didChangeDependencies();
  }

  
  Future<void> getAllProducts() async {
    productsList = await APIHandler.getProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'All Products',
          ),
        ),
        body: productsList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                
                ),
              )
            : GridView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                // ignore: prefer_const_constructors
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: ((context, index) {
                  return ChangeNotifierProvider.value(
                      value: productsList[index], child: const FeedWidget());
                }),
                itemCount: productsList.length,
              ));
  }
}
