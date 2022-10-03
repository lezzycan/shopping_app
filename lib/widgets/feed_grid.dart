import 'package:flutter/material.dart';

import 'feeds_widget.dart';

class FeedGrid extends StatelessWidget {
  const FeedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // ignore: prefer_const_constructors
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: ((context, index) {
        return const FeedWidget();
      }),
      itemCount: 3,
    );
  }
}
