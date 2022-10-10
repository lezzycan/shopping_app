import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesWidget extends StatelessWidget {
  const SalesWidget({
    super.key,
    required this.colorGradientA,
    required this.colorGradientB, required this.image,
  });

  final Color colorGradientA;
  final Color colorGradientB;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2, // use 20% of the screensize
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
            colors: <Color>[
              // Colors.orange,
              colorGradientA,
              colorGradientB
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [
              0.0,
              1.0,
            ],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: double.infinity,
                // margin: const EdgeInsets.only(left:20),
                // padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // color:Colors.blue,
                  color: Colors.blue.withOpacity(0.5),
                  // color: Constants.lightOrangeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children:  [
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            child: Text(
                              'Get the special\n discount',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                     const SizedBox(
                        height: 18,
                      ),
                const     Flexible(
                       child: SizedBox(
                         width: double.infinity,
                         child: FittedBox(
                           fit: BoxFit.fill,
                           child: Text(
                             '30 %\nOFF',
                             style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 15,
          // ),
         Flexible(
              flex: 3,
              child: Image(
                // "https://i.ibb.co/vwB46Yq/shoes.png",
                image: image,
                width: double.infinity,
                fit: BoxFit.contain,
                // height: 115,
              ))
        ],
      ),
    );
  }
}
