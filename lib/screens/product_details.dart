// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/consts/globals.dart';

class ProductDetailsState extends StatelessWidget {
  const ProductDetailsState({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const Text(
                      'Category',
                      style: Constants.kTitleStyle,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          flex: 3,
                          child: Text(
                            'Lorem Ipsum',
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
                                children: const [
                                  TextSpan(
                                      text: '168.00',
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
                            activeColor: Colors.pink
                          )
                          ),
                        autoplay: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return FancyShimmerImage(
                            imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
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
                    SizedBox(height: 10.sp,),
                    Text('Desciption', style: Constants.kTitleStyle,),
                    SizedBox(height: 10.sp,),
                    Text(''' The Head Revolt are men’s indoor premium court shoes designed for absolute comfort and confidence while giving your best shot and performing dynamic moves around the court. 
                       \n The pair has been designed for players who go extra tough on the shoes by ensuring superior stability and durability with smart design. The upper is manufactured from a combination of synthetic leather and mesh panelling – which in conjunction with the Head Cooling System provide substantial breathability improvement and ultimate comfort in stressful situations. Furthermore, there is the Head’s 180° Drift Defense technology which does provide enhanced medial and toe protection, whereas the lateral stability and foot locked properly in place is ensured by the Energy Frame and supreme TPU midfoot shank. Additionally, the shoes offer enhanced abrasion resistance and improved traction with the Hybrasion+ technology incorporated into the Hybrid outsole which performs well on all indoor playable surfaces.
                     ''', style: TextStyle(
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
