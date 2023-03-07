import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.h),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.h),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/cat/fruits.png',
                  height: size.width * 0.22,
                  width: size.width * 0.22,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Name",
                      color: color,
                      fontSize: 18.sp,
                      isTitle: true,
                    ),
                    Icon(
                      IconlyLight.heart,
                      color: color,
                      size: 22,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PriceWidget(),
                  SizedBox(
                    width: 8.w,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        FittedBox(
                          child: TextWidget(
                            text: "KG",
                            color: color,
                            fontSize: 16.sp,
                            isTitle: true,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Flexible(
                            child: TextFormField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: color, fontSize: 18.sp),
                          maxLines: 1,
                          enabled: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                      )),
                  child: TextWidget(
                    text: 'Add to cart',
                    maxLines: 1,
                    color: color,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
