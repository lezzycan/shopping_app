// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/models/products_models.dart';
import 'package:grocery_app/services/api_handler.dart';
import 'package:grocery_app/widgets/app_bar_icons.dart';
import 'package:grocery_app/screens/category_screen.dart';
import 'package:grocery_app/widgets/feed_grid.dart';
import 'package:grocery_app/screens/feedscreen.dart';
import 'package:page_transition/page_transition.dart';

import '../consts/globals.dart';
import '../consts/sales.dart';
import 'users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  // List<ProductsModel>? productsList ;
  // @override
  // void didChangeDependencies() {
  //   productsList;
  //   // APIHandler.getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getAllProducts() async {
  //   productsList = await APIHandler.getProducts();
  //   setState({});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: RefreshIndicator(
        onRefresh: () => APIHandler.getProducts(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home',
            ),
            // widget before title
            leading: AppBarIcons(
              funtion: () {
                Navigator.push(
                  context,
                  PageTransition(
                      //  fullscreenDialog: true,
                      type: PageTransitionType.fade,
                      child: const CategoryScreen()),
                );
              },
              icon: IconlyBold.category,
            ),
            //widget after title
            actions: [
              AppBarIcons(
                  icon: IconlyBold.user3,
                  funtion: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const UsersWidget()));
                  })
            ],
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
                    height: 18,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.25,
                            child: Swiper.children(
                              autoplay: true,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Latest Products',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                AppBarIcons(
                                  icon: IconlyBold.arrowRight2,
                                  funtion: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          //  fullscreenDialog: true,
                                          type: PageTransitionType.fade,
                                          child: const FeedScreenState()),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          FutureBuilder<List<ProductsModel>>(
                            future: APIHandler.getProducts(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<ProductsModel>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child:
                                      Text('An error occured ${snapshot.error}'),
                                );
                              } else if (snapshot.hasData) {
                                return FeedGrid(productsList: snapshot.data!);
                              } else {
                                return const Center(
                                  child: Text('No products has been added yet'),
                                );
                              }
                            },
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
      ),
    );
  }
}
