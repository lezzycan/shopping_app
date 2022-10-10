// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/screens/product_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../consts/globals.dart';
import '../models/products_models.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    final ProductsModel productsModelProvider = Provider.of<ProductsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    //  fullscreenDialog: true,
                    type: PageTransitionType.fade,
                    child: ProductDetailsState(id: productsModelProvider.id.toString() ,)));
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: '\$',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        children:  <TextSpan>[
                          TextSpan(
                            text: productsModelProvider.price.toString(),
                            style: TextStyle(
                              color: Constants.lightTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(IconlyBold.heart),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: productsModelProvider.images![0],//'https://placeimg.com/640/480/any',
                shimmerDuration: Duration(seconds: 2),
                width: double.infinity,
                height: 150.h,
                boxFit: BoxFit.fill,
                errorWidget: // Image(
                    // image: AssetImage('assets/images/sneaker.png'),
                    Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                  size: 28,
                ),
                // ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productsModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.1,
            // )
          ]),
        ),
      ),
    );
  }
}
