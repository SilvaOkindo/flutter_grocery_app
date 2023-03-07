import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../widgets/categoy_widget.dart';

class Categorycreen extends StatelessWidget {
  Categorycreen({super.key});

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            color: utils.color,
            text: "Categories",
            fontSize: 24.sp,
            isTitle: true,
          ),
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.h),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 350.h / 370.h,
            crossAxisSpacing: 10.h,
            mainAxisSpacing: 10.h,
            children: List.generate(6, (index) {
              return CategoryWidget(
                catText: catInfo[index]['catText'],
                gridColor: gridColors[index],
                imagePath: catInfo[index]['imgPath'],
              );
            }),
          ),
        ));
  }
}
