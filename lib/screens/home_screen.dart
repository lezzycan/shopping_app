// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/app_bar_icons.dart';
import 'package:grocery_app/widgets/feeds_widget.dart';

import '../consts/globals.dart';
import '../consts/sales.dart';

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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.25,
                          child: Swiper.children(
                            //  autoplay:true,
                            // viewportFraction: 0.8,
                            //  scale: 0.9,
                            // layout: SwiperLayout.TINDER,
                            // itemWidth: 300.0,
                            // itemHeight: 400,
                            //autoplayDelay: 2,
                            // duration: kDefaultAutoplayDelayMs,
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
                            children: sales,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Latest Products',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            AppBarIcons(icon: IconlyBold.play, funtion: () {})
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // ignore: prefer_const_constructors
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: ((context, index) {
                            return const FeedWidget();
                          }),
                          itemCount: 4,
                        ),
                      ],
                    ),
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
