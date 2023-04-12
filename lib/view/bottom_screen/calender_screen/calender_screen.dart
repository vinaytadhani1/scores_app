import 'package:flutter/material.dart';
import 'package:score_app/widget/common.dart';

class Calender_screen extends StatefulWidget {
  const Calender_screen({super.key});

  @override
  State<Calender_screen> createState() => _Calender_screenState();
}

class _Calender_screenState extends State<Calender_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackGrey,
      appBar: AppBar(
        backgroundColor: ColorConstants.blackGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Calender',
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
