// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
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
    Size size = MediaQuery.of(context).size;
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
          height: size.height,
          width: size.width,
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
                      suffixIcon: const Icon(
                        IconlyLight.search,
                        color: Constants.lightIconsColor,
                      )),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                // SizedBox(
                //   height: size.height * 0.25,
                //   child: Swiper(
                //     itemCount: 5,
                //     itemBuilder: ((context, index) {
                //      return const SalesWidget();
                //     }),
                //     pagination: const SwiperPagination(
                //       alignment: Alignment.bottomCenter,
                //       builder: DotSwiperPaginationBuilder(
                //         color: Colors.white,
                //         activeColor: Colors.black,
                //       ),
                //       ),
                //       control:  const SwiperControl(
                //         iconPrevious: Icons.arrow_back_ios,
                //         iconNext: Icons.arrow_forward_ios,
                //       ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                SizedBox(
                  height: size.height * 0.3,
                  child: Swiper.children(
                  //  autoplay:true,
                  // viewportFraction: 0.8,
                  // scale: 0.9,
                    autoplayDelay: 2,
                    duration: kDefaultAutoplayDelayMs,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Colors.black,
                      ),
                    ),
                    control: const SwiperControl(
                      iconPrevious: Icons.arrow_back_ios,
                      iconNext: Icons.arrow_forward_ios,
                    ),
                    children: [
                      SalesWidget(
                        colorGradientA: Colors.orange.withOpacity(0.5),
                        colorGradientB: Colors.grey.withOpacity(0.5),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.red.withOpacity(0.5),
                        colorGradientB: Colors.cyan.withOpacity(0.5),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.white.withOpacity(0.5),
                        colorGradientB: Colors.black.withOpacity(0.5),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.green.withOpacity(0.5),
                        colorGradientB: Colors.yellow.withOpacity(0.5),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.pink.withOpacity(0.5),
                        colorGradientB: Colors.purple.withOpacity(0.5),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
