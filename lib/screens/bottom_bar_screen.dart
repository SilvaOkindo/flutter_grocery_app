import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/providers/theme_provider.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/category_screen.dart';
import 'package:grocery_app/screens/home_page.dart';
import 'package:grocery_app/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 1;
  List<Widget> pages = [
    const HomePage(),
    const Categorycreen(),
    const CartScreen(),
    const UserScreen()
  ];
  // navigation fun
  void onTapped(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.getTheme;
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        unselectedItemColor: isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: isDark ? Colors.lightBlue : Colors.black87,
        items: [
          BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? const Icon(IconlyBold.home)
                  : const Icon(IconlyLight.home),
              label: "home"),
          BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? const Icon(IconlyBold.category)
                  : const Icon(IconlyLight.category),
              label: "category"),
          BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? const Icon(IconlyBold.buy)
                  : const Icon(IconlyLight.buy),
              label: "cart"),
          BottomNavigationBarItem(
              icon: selectedIndex == 3
                  ? const Icon(IconlyBold.user2)
                  : const Icon(IconlyLight.user2),
              label: "user"),
        ],
      ),
    );
  }
}
