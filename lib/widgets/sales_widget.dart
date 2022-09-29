import 'package:flutter/material.dart';

import '../consts/globals.dart';

class SalesWidget extends StatelessWidget {
  const SalesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2, // use 20% of the screensize
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            colors: <Color>[
              Colors.orange.withOpacity(0.5),
              Colors.grey.withOpacity(0.5),
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
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: double.infinity,
                // margin: const EdgeInsets.only(left:20),
                // padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Constants.lightOrangeColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.center,
                   // mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        'Get the special\n discount',
                          style: TextStyle(fontWeight: FontWeight.w300)
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '50 %  \nOFF',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Flexible(
            flex: 3,
              child:  Image(
            image: AssetImage('assets/images/sneakers.jpg'),
            width: 20,
            height: 115,
          ))
        ],
      ),
    );
  }
}
