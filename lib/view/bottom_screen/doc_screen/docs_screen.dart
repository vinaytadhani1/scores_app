import 'package:flutter/material.dart';
import 'package:score_app/widget/common.dart';

class Docs_screen extends StatefulWidget {
  const Docs_screen({super.key});

  @override
  State<Docs_screen> createState() => _Docs_screenState();
}

class _Docs_screenState extends State<Docs_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackGrey,
      appBar: AppBar(
        backgroundColor: ColorConstants.blackGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Doc Screen',
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
