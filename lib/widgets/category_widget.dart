import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/consts/globals.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
              shimmerDuration: const Duration(seconds: 2),
              width: size.width * 0.45,
              height: size.height * 0.45,

              boxFit: BoxFit.fill,
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
        ),
       const Align(
         alignment: Alignment.center,
       child: Text(
         'Category name',
         textAlign: TextAlign.center,
         style: TextStyle(
             fontSize: 24,
             fontWeight: FontWeight.bold,
             backgroundColor: Constants.lightCardColor),
       ),
        )
      ],
    );
  }
}
