import 'package:flutter/material.dart';

import '../widgets/sales_widget.dart';

List<SalesWidget> sales = [
      SalesWidget(
                        colorGradientA: Colors.orange.withOpacity(0.5),
                        colorGradientB: Colors.grey.withOpacity(0.5),
                        image: const AssetImage('assets/images/sneaker.png'),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.red.withOpacity(0.5),
                        colorGradientB: Colors.cyan.withOpacity(0.5),
                        image: const AssetImage('assets/images/sneak.png'),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.white.withOpacity(0.5),
                        colorGradientB: Colors.black.withOpacity(0.5),
                        image: const AssetImage('assets/images/sneaker.png'),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.green.withOpacity(0.5),
                        colorGradientB: Colors.yellow.withOpacity(0.5),
                        image: const AssetImage('assets/images/sleaky.png'),
                      ),
                      SalesWidget(
                        colorGradientA: Colors.pink.withOpacity(0.5),
                        colorGradientB: Colors.purple.withOpacity(0.5),
                        image: const AssetImage('assets/images/sneaker.png'),
                      ),
];
