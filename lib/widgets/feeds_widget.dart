// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:grocery_app/screens/product_details.dart';
import 'package:page_transition/page_transition.dart';

import '../consts/globals.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    child: const ProductDetailsState()));
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
                        children: const <TextSpan>[
                          TextSpan(
                            text: '400',
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
                imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
                shimmerDuration: Duration(seconds: 2),
                width: double.infinity,
                height: size.height * 0.2,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Title',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                maxLines: 2,
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
