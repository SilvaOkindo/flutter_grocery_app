import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    // required this.salePrice,
    // required this.price,
    // required this.textPrice,
    // required this.isOnSale,
  }) : super(key: key);
  // final double salePrice, price;
  // final String textPrice;
  // final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return FittedBox(
        child: Row(
      children: [
        TextWidget(
          text: "150Ksh",
          color: Colors.green,
          fontSize: 18,
        ),
        const SizedBox(
          width: 5,
        ),
         Text(
          '180Ksh',
          style: TextStyle(
            color: color,
            fontSize: 16.sp,
            decoration: TextDecoration.lineThrough,
          ),
        )
      ],
    ));
  }
}
