// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/consts/globals.dart';
import 'package:grocery_app/services/api_handler.dart';

import '../models/products_models.dart';

class ProductDetailsState extends StatefulWidget {
  const ProductDetailsState({super.key, required this.id});
  final String id;
  @override
  State<ProductDetailsState> createState() => _ProductDetailsStateState();
}

class _ProductDetailsStateState extends State<ProductDetailsState> {
  ProductsModel? productsModel;
  Future<void> getProductInfo() async {
    productsModel = await APIHandler.getProductById(widget.id);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: productsModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const BackButton(),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productsModel!.category.toString(),
                            style: Constants.kTitleStyle,
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  productsModel!.title.toString(),
                                  style: Constants.kTitleStyle,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: RichText(
                                  text: TextSpan(
                                      text: '\$',
                                      style: Constants.kTitleStyle
                                          .copyWith(color: Colors.red),
                                      children: [
                                        TextSpan(
                                            text:
                                                productsModel!.price.toString(),
                                            style: Constants.kTitleStyle)
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          SizedBox(
                            height: size.height * 0.5,
                            child: Swiper(
                              control: SwiperControl(color: Colors.red),
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter,
                                  builder: DotSwiperPaginationBuilder(
                                      color: Colors.white,
                                      activeColor: Colors.pink)),
                              autoplay: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return FancyShimmerImage(
                                  imageUrl:
                                      productsModel!.images![index].toString(),
                                  shimmerDuration: Duration(seconds: 2),
                                  width: double.infinity,
                                  height: size.height * 0.2,
                                  boxFit: BoxFit.contain,
                                  errorWidget: Icon(
                                    IconlyBold.danger,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                  // ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Description',
                            style: Constants.kTitleStyle,
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            productsModel!.description.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
