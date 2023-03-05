import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/providers/theme_provider.dart';
import 'package:grocery_app/screens/bottom_bar_screen.dart';
import 'package:provider/provider.dart';

import 'const/theme_data.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  ThemeProvider themeProvider = ThemeProvider();
  void getCurrentTheme() async {
    themeProvider.setTheme = await themeProvider.themePref.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (_, child) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeProvider;
          })
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: Style.themeData(themeProvider.getTheme, context),
              home: const BottomBarScreen() //Colors.blueGrey,
              ,
            );
          }
        ),
      );
    });
  }
}
