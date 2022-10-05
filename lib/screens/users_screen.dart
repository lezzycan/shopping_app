import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/user_widget.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 15,
     //   itemExtent: ,
        itemBuilder: (BuildContext context, int index) {
          return const CustomContainer();
        },
      ),
    );
  }
}
