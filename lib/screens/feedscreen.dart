import 'package:flutter/material.dart';

import '../widgets/feed_grid.dart';

class FeedScreenState extends StatelessWidget {
  const FeedScreenState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
          title: const Text(
            'All Products',
          ),
      ),
      body: const FeedGrid());
  }
}
