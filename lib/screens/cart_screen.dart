import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Column(
          children: [
            Container(
              color: Colors.yellow,
              height: 100.h,
            ),
            Container(
              color: Colors.red,
              height: 400.h,
            ),
            
          ],
        ));
  }
}
