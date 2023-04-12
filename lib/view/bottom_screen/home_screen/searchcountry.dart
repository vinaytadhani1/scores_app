// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'selectcountry.dart';
class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  List<dynamic> countryList = [];
  String? name;
  String? flag;

  TextEditingController textEditingController = TextEditingController();

  void search(String search) async {
    final response = await http.get(
      Uri.parse(
          'https://api-football-v1.p.rapidapi.com/v3/countries?search=$search'),
      headers: {
        'X-RapidAPI-Key': 'a6f7b2bb82mshc8dbfebbbb5bc1ap109062jsne76a1fab759b',
        'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      setState(() {
        countryList = json.decode(response.body)['response'];
      });
      print(countryList[0]);
    }
  }

  @override
  void initState() {
    //search("engl");
    textEditingController.addListener(() {
      search(textEditingController.text);
    });
    countryList = [];
    setState(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.arrow_back_outlined)),
                  ),
                  title: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Search Any Country',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  actions: [
                    GestureDetector(
                        onTap: () {
                          textEditingController.clear();
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(Icons.close))),
                  ],
                ),
                body: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countryList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          name = countryList[index]["name"];
                          flag = countryList[index]["flag"];
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SelectCountry(name: name,flag: flag,)),
                              );
                        });
                      },
                      leading: SvgPicture.network(
                        countryList[index]["flag"],
                        height: 25,
                        width: 25,
                      ),
                      title: Text(
                        countryList[index]["name"],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              );
  }
}