// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_app/widget/common.dart';
import '../../../model/live_scrore.dart';
import '../../../model/today_match.dart';
import '../../../widget/today_matchtile.dart';
import '../../live_score.dart';
import 'leagues_screen.dart';
import 'liveontap_screen.dart';
import 'searchcountry.dart';
import 'package:http/http.dart' as http;

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  GlobalKey<ScaffoldState> scaffoldd = GlobalKey();

  late PageController _pageController;

  int currentTab = 0;

  List<String> topics = [
    "Sun",
    "Mon",
    "Tod",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  List<String> date = [
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
  ];

  TodayMatchModel? todayMatch;
  Live_Scrore? livescore;

  getLivescore() async {
    var response = await http.get(
        Uri.parse('https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all'),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': hoostKey,
        });
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      livescore = Live_Scrore.fromJson(body);
      print("+++Get Live score+++++++${livescore?.response?[0].teams!.home!.logo}");
      setState(() {});
    }
  }

  getTodayMatch() async {
    var response = await http.get(
        Uri.parse(
            'https://api-football-v1.p.rapidapi.com/v3/fixtures?season=2022&league=39'),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': hoostKey,
        });
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      todayMatch = TodayMatchModel.fromJson(body);
      print("+++Get Today Match+++++++${todayMatch?.response?[0].teams!.home!.logo}");
      setState(() {});
    }
  }

  @override
  void initState() {
    getLivescore();
    getTodayMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldd,
      backgroundColor: ColorConstants.blackGrey,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(Leagues_Screen());
              },
              child: Text('Get All Leagues'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(Live_Score_Screen());
              },
              child: Text('Get Live Score'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorConstants.blackGrey,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                scaffoldd.currentState!.openDrawer();
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/menu.png'),
                  ),
                ),
              ),
            );
          },
        ),
        title: Text(
          'Score Board',
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(6),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Image(
                  image: AssetImage('assets/notification.png'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchCountry()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(6),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Image(
                  image: AssetImage('assets/search.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 13),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/calendar.png',
                    height: 14,
                    width: 14,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Oct 17,2022',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: topics.length,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Row(
                        children: [
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentTab = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 35,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: currentTab == index
                                    ? Color(0xffFF2882)
                                    : null,
                                // color: Color(0xffAEAEB2),
                                borderRadius: currentTab == index
                                    ? BorderRadius.circular(14)
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    topics[index],
                                    style: TextStyle(
                                        color: Color(0xffAEAEB2), fontSize: 12),
                                  ),
                                  Text(
                                    date[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Visibility(
                          //     visible: currentTab == index,
                          //     child: Container(
                          //       width: 5,
                          //       height: 5,
                          //       decoration: const BoxDecoration(
                          //           color: Colors.deepPurpleAccent,
                          //           shape: BoxShape.circle),
                          //     ))
                        ],
                      );
                    }),
              ),

              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Live Match',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              // CarouselSlider(
              //   items: [
              //     //1st Image of Slider
              //     Container(
              //       height: 180,
              //       width: 350,
              //       margin: EdgeInsets.only(top: 12, bottom: 12),
              //       decoration: BoxDecoration(
              //         color: Color(0xFF37003C),
              //         borderRadius: BorderRadius.circular(16),
              //         image: DecorationImage(
              //           image: AssetImage("assets/Mask Group.png"),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       child: Stack(
              //         children: [
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(height: 10),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     'Stamford Bridge',
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 14,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     'Week 10',
              //                     style: TextStyle(
              //                       color: Colors.grey,
              //                       fontSize: 12,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 mainAxisAlignment:
              //                     MainAxisAlignment.spaceAround,
              //                 children: [
              //                   Column(
              //                     children: [
              //                       Image(
              //                         image: AssetImage('assets/chelsea.png'),
              //                         height: 60,
              //                         width: 60,
              //                       ),
              //                       SizedBox(height: 5),
              //                       Text(
              //                         'Chelsea',
              //                         style: TextStyle(
              //                           color: Colors.white,
              //                           fontSize: 13,
              //                         ),
              //                       ),
              //                       Text(
              //                         'Home',
              //                         style: TextStyle(
              //                           color: Colors.grey,
              //                           fontSize: 10,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: [
              //                       Text(
              //                         '1 : 1',
              //                         style: TextStyle(
              //                             color: Colors.white, fontSize: 28),
              //                       ),
              //                       Container(
              //                         clipBehavior: Clip.antiAlias,
              //                         alignment: Alignment.center,
              //                         padding: EdgeInsets.all(5),
              //                         margin: EdgeInsets.all(2),
              //                         decoration: BoxDecoration(
              //                           color: Color(0xff00C566)
              //                               .withOpacity(0.4),
              //                           borderRadius:
              //                               BorderRadius.circular(14),
              //                           border: Border.all(
              //                               color: Color(0xff00C566),
              //                               width: 0.8),
              //                         ),
              //                         child: Text(
              //                           '90+4',
              //                           style: TextStyle(
              //                               fontSize: 10,
              //                               color: Color(0xff00C566)),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Column(
              //                     children: [
              //                       Image(
              //                         image:
              //                             AssetImage('assets/mancgester.png'),
              //                         height: 60,
              //                         width: 60,
              //                       ),
              //                       SizedBox(height: 5),
              //                       Text(
              //                         'Man Utd',
              //                         style: TextStyle(
              //                           color: Colors.white,
              //                           fontSize: 13,
              //                         ),
              //                       ),
              //                       Text(
              //                         'Away',
              //                         style: TextStyle(
              //                           color: Colors.grey,
              //                           fontSize: 10,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              //   //Slider Container properties
              //   options: CarouselOptions(
              //     height: 190.0,
              //     enlargeCenterPage: true,
              //     autoPlay: false,
              //     aspectRatio: 10 / 5,
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     enableInfiniteScroll: true,
              //     autoPlayAnimationDuration: Duration(milliseconds: 800),
              //     viewportFraction: 0.8,
              //   ),
              // ),

              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: 190,
              //   child: PageView.builder(
              //       itemCount: 2,
              //       pageSnapping: true,
              //       itemBuilder: (context, pagePosition) {
              //         return GestureDetector(
              //           onTap: () {
              //             Get.to(LiveMatch_Screen());
              //           },
              //           child: Container(
              //             // height: MediaQuery.of(context).size.height/10,
              //             width: 350,
              //             margin: EdgeInsets.only(
              //                 top: 12, bottom: 12, right: 10, left: 5),
              //             decoration: BoxDecoration(
              //               color: Color(0xFF37003C),
              //               borderRadius: BorderRadius.circular(16),
              //               image: DecorationImage(
              //                 image: AssetImage("assets/Mask Group.png"),
              //                 fit: BoxFit.cover,
              //               ),
              //               boxShadow: [
              //                 BoxShadow(
              //                     color: Colors.black.withOpacity(0.3),
              //                     offset: Offset(0, 43),
              //                     blurRadius: 5,
              //                     spreadRadius: -35)
              //               ],
              //             ),
              //             child: Stack(
              //               children: [
              //                 Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     SizedBox(height: 10),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.center,
              //                       children: [
              //                         Text(
              //                           'Stamford Bridge',
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 14,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.center,
              //                       children: [
              //                         Text(
              //                           'Week 10',
              //                           style: TextStyle(
              //                             color: Colors.grey,
              //                             fontSize: 12,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceAround,
              //                       children: [
              //                         Column(
              //                           children: [
              //                             Image(
              //                               image: AssetImage(
              //                                   'assets/chelsea.png'),
              //                               height: 60,
              //                               width: 60,
              //                             ),
              //                             SizedBox(height: 5),
              //                             Text(
              //                               'Chelsea',
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: 13,
              //                               ),
              //                             ),
              //                             Text(
              //                               'Home',
              //                               style: TextStyle(
              //                                 color: Colors.grey,
              //                                 fontSize: 10,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         Column(
              //                           children: [
              //                             Text(
              //                               '1 : 1',
              //                               style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontSize: 28),
              //                             ),
              //                             Container(
              //                               clipBehavior: Clip.antiAlias,
              //                               alignment: Alignment.center,
              //                               padding: EdgeInsets.all(5),
              //                               margin: EdgeInsets.all(2),
              //                               decoration: BoxDecoration(
              //                                 color: Color(0xff00C566)
              //                                     .withOpacity(0.4),
              //                                 borderRadius:
              //                                     BorderRadius.circular(14),
              //                                 border: Border.all(
              //                                     color: Color(0xff00C566),
              //                                     width: 0.8),
              //                               ),
              //                               child: Text(
              //                                 '90+4',
              //                                 style: TextStyle(
              //                                     fontSize: 10,
              //                                     color: Color(0xff00C566)),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         Column(
              //                           children: [
              //                             Image(
              //                               image: AssetImage(
              //                                   'assets/mancgester.png'),
              //                               height: 60,
              //                               width: 60,
              //                             ),
              //                             SizedBox(height: 5),
              //                             Text(
              //                               'Man Utd',
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: 13,
              //                               ),
              //                             ),
              //                             Text(
              //                               'Away',
              //                               style: TextStyle(
              //                                 color: Colors.grey,
              //                                 fontSize: 10,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       }),
              // ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 190,
                child: livescore?.response == null
                    ?
                    // Center(
                    //     child: Container(
                    //     alignment: Alignment.center,
                    //     // height: MediaQuery.of(context).size.height/10,
                    //     width: 350,
                    //     margin: EdgeInsets.only(
                    //         top: 12, bottom: 12, right: 10, left: 5),
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey.shade400,
                    //       borderRadius: BorderRadius.circular(16),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.black.withOpacity(0.3),
                    //             offset: Offset(0, 43),
                    //             blurRadius: 5,
                    //             spreadRadius: -35)
                    //       ],
                    //     ),
                    //   )
                    //     // Text('Loading....',style: TextStyle(color: Colors.white,fontSize: 20),),
                    //     )
                    Center(
                        child: Text(
                          'Loading...',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    : PageView.builder(
                        itemCount: livescore?.response!.length,
                        pageSnapping: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, pagePosition) {
                          return GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   print("++++${livescore?.response![pagePosition].teams!.home!.name??''}");
                              // });
                              // Get.to(LiveMatch_Screen());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // height: MediaQuery.of(context).size.height/10,
                              width: 350,
                              margin: EdgeInsets.only(
                                  top: 12, bottom: 12, right: 10, left: 5),
                              decoration: BoxDecoration(
                                color: Color(0xFF37003C),
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage("assets/Mask Group.png"),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(0, 43),
                                      blurRadius: 5,
                                      spreadRadius: -35)
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text( livescore?.response![pagePosition].fixture!.venue!.name ??"",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Week 10',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Image(
                                                image: NetworkImage(livescore
                                                        ?.response![
                                                            pagePosition]
                                                        .teams!
                                                        .home!
                                                        .logo ??
                                                    ""),
                                                height: 60,
                                                width: 60,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                livescore
                                                        ?.response![
                                                            pagePosition]
                                                        .teams!
                                                        .home!
                                                        .name ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                'Home',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${livescore?.response![pagePosition].goals!.home} : ${livescore?.response![pagePosition].goals!.away}',
                                                // '1 : 1',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28),
                                              ),
                                              Container(
                                                clipBehavior: Clip.antiAlias,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(5),
                                                margin: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  color: Color(0xff00C566)
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  border: Border.all(
                                                      color: Color(0xff00C566),
                                                      width: 0.8),
                                                ),
                                                child: Text(
                                                  '90+4',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xff00C566)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image(
                                                image: NetworkImage(livescore
                                                        ?.response![
                                                            pagePosition]
                                                        .teams!
                                                        .away!
                                                        .logo ??
                                                    ""),
                                                height: 60,
                                                width: 60,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                livescore
                                                        ?.response![
                                                            pagePosition]
                                                        .teams!
                                                        .away!
                                                        .name ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                'Away',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/premier league.png',
                    ),
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Today Match',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage(
                      'assets/arrow-right.png',
                    ),
                    height: 25,
                    width: 25,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                flex: 10,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: todayMatch?.response == null
                      ? Center(
                          child: Text(
                            'Loading...',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: todayMatch?.response!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 10),
                                TodayMatchTile(
                                  tema1: todayMatch?.response![index].teams!
                                          .home!.name ??
                                      "",
                                  tema2: todayMatch?.response![index].teams!
                                          .away!.name ??
                                      "",
                                  tema1img: todayMatch?.response![index].teams!
                                          .home!.logo ??
                                      "",
                                  tema2img: todayMatch?.response![index].teams!
                                          .away!.logo ??
                                      "",
                                  minuteNumber:
                                      "${todayMatch?.response![index].goals!.home} : ${todayMatch?.response![index].goals!.away}",
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                ),
              ),
              
              SizedBox(height: 12),
              // TodayMatchTile(
              //   tema1: 'N Forest',
              //   tema2: 'Liverpool',
              //   tema1img: 'assets/nforest.png',
              //   tema2img: 'assets/liverpool.png',
              //   minuteNumber: '06:30',
              // ),
              // SizedBox(height: 12),
              // TodayMatchTile(
              //   tema1: 'Man City',
              //   tema2: 'Brighton',
              //   tema1img: 'assets/manchester.png',
              //   tema2img: 'assets/brighton.png',
              //   minuteNumber: '06:30',
              // ),
              // SizedBox(height: 12),
              // TodayMatchTile(
              //   tema1: 'Wolves',
              //   tema2: 'Leichester',
              //   tema1img: 'assets/wolves.png',
              //   tema2img: 'assets/leicester.png',
              //   minuteNumber: '06:30',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
