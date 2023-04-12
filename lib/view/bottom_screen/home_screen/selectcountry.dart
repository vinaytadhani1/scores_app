// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class SelectCountry extends StatefulWidget {
   String? name;
  String? flag;
   SelectCountry({super.key, required this.flag, required this.name});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Selected Country"),
            ),
            body:
                
                ListTile(
                    leading: SvgPicture.network(
                      widget.flag.toString(),
                      height: 25,
                      width: 25,
                    ),
                    title: Text(
                      widget.name.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )));
  }
}