import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/providers/theme_provider.dart';
import 'package:grocery_app/screens/inner_screen.dart/onsale_screen.dart';
import 'package:grocery_app/screens/inner_screen.dart/product_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/feed_widget.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> offerImages = [
    "assets/images/offers/Offer1.jpg",
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    "assets/images/offers/Offer4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: offerImages.length,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.red,
                  activeSize: 15,
                  size: 10,
                ),
              ),
              //control: SwiperControl(),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextButton(
            onPressed: () {
              GlobalMethods.navigateTo(
                context: context,
                routeName: OnSaleScreen.routeName,
              );
            },
            child: TextWidget(
              text: "View all",
              color: Colors.blue,
              fontSize: 16.h,
            ),
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(
                      text: 'ONSALE',
                      color: Colors.red,
                      fontSize: 22.sp,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.24,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return const OnSaleWidget();
                      }),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Our popular",
                  color: color,
                  fontSize: 22.sp,
                ),
                TextButton(
                  onPressed: () {
                    GlobalMethods.navigateTo(
                      context: context,
                      routeName: ProductScreen.routeName,
                    );
                  },
                  child: TextWidget(
                    text: "Browser all",
                    color: Colors.blue,
                    fontSize: 16.h,
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            childAspectRatio: size.width / (size.height * 0.55),
            //crossAxisSpacing: 10.h,
            mainAxisSpacing: 10.h,
            shrinkWrap: true,
            children: List.generate(6, (index) {
              return const FeedWidget();
            }),
          )
        ],
      ),
    ));
  }
}
