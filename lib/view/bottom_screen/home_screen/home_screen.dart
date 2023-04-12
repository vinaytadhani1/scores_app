// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_app/api/livematch_api.dart';
import 'package:score_app/widget/common.dart';
import '../../../api/seasonleagueclass_api.dart';
import '../../../widget/today_matchtile.dart';
import '../../live_score.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldd,
      backgroundColor: ColorConstants.blackGrey,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Get.to(Live_Score_Screen());
            //   },
            //   child: Text('data'),
            // ),
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
              FutureBuilder(
                future: LiveMatchApi().getAllliveScore(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 190,
                      child: PageView.builder(
                        itemCount: snapshot.data!.response?.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          print("------${snapshot.data!.response!}------");
                          return GestureDetector(
                            onTap: () {
                              Get.to(LiveMatch_Screen(
                                  response: snapshot.data!.response![index]));
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
                                          Text(
                                            snapshot.data!.response![index]
                                                    .fixture!.venue!.name ??
                                                "",
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
                                                image: NetworkImage(snapshot
                                                        .data!
                                                        .response![index]
                                                        .teams!
                                                        .home!
                                                        .logo ??
                                                    ""),
                                                height: 60,
                                                width: 60,
                                              ),
                                              SizedBox(height: 5),
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  snapshot
                                                          .data!
                                                          .response![index]
                                                          .teams!
                                                          .home!
                                                          .name ??
                                                      "",
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
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
                                                '${snapshot.data!.response![index].goals!.home} : ${snapshot.data!.response![index].goals!.away}',
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
                                                image: NetworkImage(snapshot
                                                        .data!
                                                        .response![index]
                                                        .teams!
                                                        .away!
                                                        .logo ??
                                                    ""),
                                                height: 60,
                                                width: 60,
                                              ),
                                              SizedBox(height: 5),
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  snapshot
                                                          .data!
                                                          .response![index]
                                                          .teams!
                                                          .away!
                                                          .name ??
                                                      "",
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
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
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  }
                },
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

              FutureBuilder(
                future: SeasonleagueClass().getseasonleague(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  } else {
                    return Expanded(
                      flex: 10,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.results!,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 10),
                                TodayMatchTile(
                                  tema1: snapshot.data!.response![index].teams!
                                          .home!.name ??
                                      "",
                                  tema2: snapshot.data!.response![index].teams!
                                          .away!.name ??
                                      "",
                                  tema1img: snapshot.data!.response![index]
                                          .teams!.home!.logo ??
                                      "",
                                  tema2img: snapshot.data!.response![index]
                                          .teams!.away!.logo ??
                                      "",
                                  minuteNumber:
                                      "${snapshot.data!.response![index].goals!.home} : ${snapshot.data!.response![index].goals!.away}",
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
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
