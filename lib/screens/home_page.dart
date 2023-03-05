import 'package:flutter/material.dart';
import 'package:grocery_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
          child: SwitchListTile(
        onChanged: (value) {
         setState(() {
            themeProvider.setTheme = value;
         });
        },
        value: themeProvider.getTheme,
        title: const Text('Theme'),
        secondary: themeProvider.getTheme
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
      )),
    );
  }
}
