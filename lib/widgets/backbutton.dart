import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child:const Icon(
        IconlyBold.arrowLeft3,
      ),
    );
  }
}
