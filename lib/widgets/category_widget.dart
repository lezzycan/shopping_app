import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/globals.dart';
import 'package:provider/provider.dart';

import '../models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var categoryProvider = Provider.of<CategoriesModel>(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            imageUrl: categoryProvider.image.toString(),
            shimmerDuration: const Duration(seconds: 2),
            width: size.width * 0.45,
            height: size.height * 0.45,

            // boxFit: BoxFit.fill,
            errorWidget: // Image(
                // image: AssetImage('assets/images/sneaker.png'),
                const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
            // ),
          ),
        ),
         Align(
          alignment: Alignment.center,
          child: Text(
            categoryProvider.name.toString(),
            textAlign: TextAlign.center,
            style:const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: Constants.lightCardColor),
          ),
        )
      ],
    );
  }
}
