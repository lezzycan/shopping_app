import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../consts/globals.dart';
import '../models/users_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var userProvider = Provider.of<UsersModel>(context);
    return ListTile(
      isThreeLine: true,
      leading: FancyShimmerImage(
        imageUrl: userProvider.avatar.toString(),
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
      title:  Text('${userProvider.name}'),
      subtitle:  Text('${userProvider.email}'),
      trailing:  Text(
        userProvider.role.toString(),
        style: const TextStyle(
            color: Constants.lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
