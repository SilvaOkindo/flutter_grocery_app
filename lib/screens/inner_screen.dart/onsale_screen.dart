import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});

  static String routeName = '/onsale_scren';

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Products onsale',
          color: color,
          fontSize: 18.sp,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        childAspectRatio: size.width / (size.height * 0.50),
        //crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
        shrinkWrap: true,
        children: List.generate(16, (index) {
          return const OnSaleWidget();
        }),
      ),
    );
  }
}
