import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/globals.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      isThreeLine: true,
      leading: FancyShimmerImage(
        imageUrl: 'https://placeimg.com/640/480/any',
        shimmerDuration: const Duration(seconds: 2),  
        width: size.width * 0.15,
        height: size.width * 0.15,

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
      title: const Text('Jhoon'),
      subtitle: const Text('Email@gmail.com'),
      trailing: const Text(
        'User role',
        style: TextStyle(color: Constants.lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
