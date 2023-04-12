import 'package:flutter/material.dart';
import 'package:score_app/view/bottom_screen/calender_screen/fixturescreen.dart';
import 'package:score_app/view/bottom_screen/doc_screen/docs_screen.dart';
import 'package:score_app/view/bottom_screen/live_screen/live_screen.dart';

import 'view/bottom_screen/home_screen/home_screen.dart';

class Main_Home_Page extends StatefulWidget {
  const Main_Home_Page({super.key});

  @override
  State<Main_Home_Page> createState() => _Main_Home_PageState();
}

class _Main_Home_PageState extends State<Main_Home_Page> {

  int pageIndex = 0;

  final pages = [
    const Home_Screen(),
    const FixtureScreen(),
    const Docs_screen(),
    const Live_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0XFF1C1C1E),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/drawer/home.png',height: 28,width: 28,
                        color:pageIndex == 0 ? Colors.white : Color(0xFF8E8E93),
                      ),
                      SizedBox(height: 5),
                      pageIndex == 0 ? 
                      Container(
                        height: 5,width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == 0 ? Color(0xffFF2882) : Colors.transparent,
                        ),
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                // Cngstationlist();
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/drawer/calender.png',height: 40,width: 40,
                      color:pageIndex == 1 ? Colors.white : Color(0xFF8E8E93),
                    ),
                    pageIndex ==1 ? 
                    Container(
                      height: 5,width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageIndex == 1 ? Color(0xffFF2882) : Colors.transparent,
                      ),
                    ) : SizedBox(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/drawer/doc.png',height: 40,width: 40,
                      color:pageIndex == 2 ? Colors.white : Color(0xFF8E8E93),
                    ),
                    pageIndex ==2 ? 
                    Container(
                      height: 5,width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageIndex ==2 ? Color(0xffFF2882) : Colors.transparent,
                      ),
                    ) : SizedBox(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/drawer/camera.png',height: 40,width: 40,
                      color:pageIndex == 3 ? Colors.white : Color(0xFF8E8E93),
                    ),
                    pageIndex ==3 ? 
                    Container(
                      height: 5,width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageIndex == 3 ? Color(0xffFF2882) : Colors.transparent,
                      ),
                    ) : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
      ),
      body: pages[pageIndex],
    );
  }
}