import 'package:flutter/material.dart';
import 'package:score_app/widget/common.dart';

class Live_Screen extends StatefulWidget {
  const Live_Screen({super.key});

  @override
  State<Live_Screen> createState() => _Live_ScreenState();
}

class _Live_ScreenState extends State<Live_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackGrey,
      appBar: AppBar(
        backgroundColor: ColorConstants.blackGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Live Screen',
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
