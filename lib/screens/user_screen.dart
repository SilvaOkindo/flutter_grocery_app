import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = themeProvider.getTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'Hi, ',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 27.sp),
                            children: [
                          TextSpan(
                            text: "MyName",
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          )
                        ])),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextWidget(
                      text: 'okindo@gmail.com',
                      color: color,
                      fontSize: 18.sp,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              listTile(
                  title: "Address",
                  substitle: 'my address',
                  icon: IconlyLight.profile,
                  onpressed: () async {
                    await showAddressDialog();
                  },
                  color: color),
              listTile(
                title: "Orders",
                icon: IconlyLight.bag,
                onpressed: () {},
                color: color,
              ),
              listTile(
                title: "Wishlist",
                icon: IconlyLight.heart,
                onpressed: () {},
                color: color,
              ),
              listTile(
                title: "Viewed",
                icon: IconlyLight.show,
                onpressed: () {},
                color: color,
              ),
              listTile(
                  title: "Forgot password",
                  icon: IconlyLight.unlock,
                  onpressed: () {},
                  color: color),
              SwitchListTile(
                onChanged: (value) {
                  setState(() {
                    themeProvider.setTheme = value;
                  });
                },
                value: themeProvider.getTheme,
                title: TextWidget(
                  text: themeProvider.getTheme ? 'Dark Theme' : "Light Theme",
                  color: color,
                  fontSize: 18.sp,
                ),
                secondary: themeProvider.getTheme
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
              ),
              listTile(
                title: "Logout",
                icon: IconlyLight.logout,
                onpressed: () async {
                  await showSignoutDialog();
                },
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showSignoutDialog() async {
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Row(children: [
              Container(
                height: 20.h,
                width: 20.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/warning-sign.png'),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              const Text('Singout')
            ]),
            content: const Text("Do you want to sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  if(Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.redAccent),
                ),
              )
            ],
          );
        });
  }

  Future<void> showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: "Your address",
              ),
              maxLines: 5,
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text('Update'))
            ],
          );
        });
  }

  Widget listTile(
      {required String title,
      String? substitle,
      required IconData icon,
      required Function onpressed,
      required Color color}) {
    //var fontSize;
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        fontSize: 22.sp,
      ),
      subtitle:
          TextWidget(text: substitle ?? '', color: color, fontSize: 18.sp),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onpressed();
      },
    );
  }
}
