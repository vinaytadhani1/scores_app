import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_app/view/bottom_screen/home_screen/home_screen.dart';
import 'package:score_app/widget/common.dart';

import 'main_home_page.dart';

void main() {
  runApp(const MyApp());
}
// /usr/bin/git
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'poppins',
        colorSchemeSeed: ColorConstants.blackGrey,
      ),
      home: Main_Home_Page(),
    );
  }
}
