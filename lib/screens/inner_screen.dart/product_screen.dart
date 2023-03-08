import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/feed_widget.dart';

import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  static String routeName = '/product_screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController? searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchController?.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: 'All Products',
          color: color,
          fontSize: 18,
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.greenAccent, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.greenAccent, width: 1)),
                    hintText: 'Search',
                    prefix: const Icon(Icons.search_outlined),
                    suffix: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: searchFocusNode.hasFocus ? Colors.red : color,
                      ),
                      onPressed: () {
                        searchController?.clear();
                        searchFocusNode.unfocus();
                      },
                    )),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            childAspectRatio: size.width / (size.height * 0.55),
            //crossAxisSpacing: 10.h,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            children: List.generate(16, (index) {
              return const FeedWidget();
            }),
          ),
        ],
      )),
    );
  }
}
