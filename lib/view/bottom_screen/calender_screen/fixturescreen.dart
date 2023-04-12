import 'package:flutter/material.dart';
import 'package:score_app/widget/common.dart';

class FixtureScreen extends StatefulWidget {
  const FixtureScreen({super.key});

  @override
  State<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackGrey,
      appBar: AppBar(
        backgroundColor: ColorConstants.blackGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Fixture Screen',
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
