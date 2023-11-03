import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_app/view/screens/Login_Page.dart';
import 'package:posts_app/view/screens/Navpage.dart';
import 'package:posts_app/view/screens/SignUp_Page.dart';
import 'package:posts_app/view/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Splash',
      getPages: [
        GetPage(name: "/SignUp", page: () => SignUp_Page()),
        GetPage(name: "/Home", page: () => NavPage()),
        GetPage(name: "/", page: () => const Login_Page()),
        GetPage(name: "/Splash", page: () => const splash()),
      ],
    );
  }
}
