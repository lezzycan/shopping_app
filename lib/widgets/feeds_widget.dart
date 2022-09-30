// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

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
          borderRadius:BorderRadius.circular(8.0) ,
          onTap: (){},
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(left:5.0, right: 5, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
               Flexible(child:  Text('£400', style: TextStyle(fontWeight: FontWeight.w600),)),
                 Icon(IconlyBold.heart),
                ],
              ),
            ),
            const SizedBox(height: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:   FancyShimmerImage(
              imageUrl:'https://i.ibb.co/vwB46Yq/shoes.png' ,
              width: double.infinity,
              height: size.height *0.2,
              boxFit: BoxFit.fill,
              errorWidget: Image(image: AssetImage('assets/images/sneaker.png'),
              ),),),
            SizedBox(height: 10,),

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('Title',
           overflow: TextOverflow.ellipsis,
           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
           ),
         ),
          
          ]),
        ),
      ),
    );
  }
}
