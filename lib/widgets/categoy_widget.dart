import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/providers/theme_provider.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.catText,
      required this.imagePath,
      required this.gridColor});

  final String catText, imagePath;
  final Color gridColor;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = themeProvider.getTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: gridColor,
            border: Border.all(color: Colors.red.withOpacity(0.7), width: 2),
            borderRadius: BorderRadius.circular(16.w)),
        child: Column(
          children: [
            Container(
             height: 140.w,
            width: 140.w,
              decoration: BoxDecoration(
                //color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.contain),
              ),
            ),
            TextWidget(
              text: catText,
              isTitle: true,
              fontSize: 20.sp,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
