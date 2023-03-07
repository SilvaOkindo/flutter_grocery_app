import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = theme ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.w),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/cat/Spinach.png',
                      width: size.width * 0.22,
                      height: size.width * 0.22,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: '1KG',
                          color: color,
                          fontSize: 22.sp,
                          isTitle: true,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.heart,
                                size: 22,
                                color: color,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                const PriceWidget(),
                SizedBox(
                  height: 8.h,
                ),
                TextWidget(
                  text: "Product name",
                  color: color,
                  fontSize: 16.sp,
                  isTitle: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
