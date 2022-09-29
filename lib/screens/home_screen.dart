// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/app_bar_icons.dart';
import 'package:grocery_app/widgets/sales_widget.dart';

import '../consts/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
          ),
          // widget before title
          leading: AppBarIcons(
            funtion: () {},
            icon: IconlyBold.category,
          ),
          //widget after title
          actions: [AppBarIcons(icon: IconlyBold.user3, funtion: () {})],
        ),
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [ 
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _textController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search ',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).cardColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    suffixIcon: const Icon(IconlyLight.search, color:  Constants.lightIconsColor,)
                  ),
                ),
              const  SizedBox(height: 4.0,),
                const SalesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
