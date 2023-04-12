import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api/seasonleagueclass_api.dart';
import '../model/live_scrore.dart';
import '../widget/common.dart';
import '../widget/today_matchtile.dart';

class Live_Score_Screen extends StatefulWidget {
  const Live_Score_Screen({super.key});

  @override
  State<Live_Score_Screen> createState() => _Live_Score_ScreenState();
}

class _Live_Score_ScreenState extends State<Live_Score_Screen> {

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
      print("++++++++++${livescore?.response![0].teams!.home!.logo}");
      setState(() {});
    }
  }

  Future<Live_Scrore> getAllliveScore() async {
    var data;
    final result = await http.get(
      Uri.parse('https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all'),
      headers: {
        'X-RapidAPI-Key': 'a6f7b2bb82mshc8dbfebbbb5bc1ap109062jsne76a1fab759b',
        'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
      },
    );
    if (result.statusCode == 200) {
      print(result.body.toString());
      livescore = Live_Scrore.fromJson(json.decode(result.body));
      setState(() {
    });
      print(livescore!.response![1].goals!.home);
    }
    return livescore!;
  }
  
  @override
  void initState() {
    getLivescore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  child: 
                  livescore?.response == null ? 
                    Center(
                    child: Text('Loading....'),
                  )
                  : 
                  PageView.builder(
                      itemCount: livescore?.response?.length,
                      pageSnapping: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, pagePosition) {
                        return GestureDetector(
                          onTap: () {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          livescore?.response![pagePosition].fixture!.venue!.name??"",
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
                                              image: NetworkImage(
                                                  livescore?.response![pagePosition].teams!.home!.logo??""),
                                              height: 60,
                                              width: 60,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              livescore?.response![pagePosition].teams!.home!.name??"",
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
                                              image: NetworkImage(
                                                  livescore?.response![pagePosition].teams!.away!.logo??""),
                                              height: 60,
                                              width: 60,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              livescore?.response![pagePosition].teams!.away!.name??"",
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
                      }
                    ),
                ),
            
            SizedBox(height: 15),
            SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  child: FutureBuilder(
                future: getAllliveScore(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 190,
                      child: PageView.builder(
                        itemCount: livescore?.response?.length,
                        itemBuilder: (context, index) {
                          print(livescore?.response!.length);
                              return GestureDetector(
                              onTap: () {
                                // Get.to(LiveMatchScreen());
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
                                  // image: DecorationImage(
                                  //   image: AssetImage("assets/Mask Group.png"),
                                  //   fit: BoxFit.cover,
                                  // ),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              livescore?.response![index].fixture!
                                                      .venue!.name ??
                                                  "",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                                          ?.response![index]
                                                          .teams!
                                                          .home!
                                                          .logo ??
                                                      ""),
                                                  height: 60,
                                                  width: 60,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  livescore?.response![index].teams!
                                                          .home!.name ??
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
                                                  '${livescore?.response![index].goals!.home} : ${livescore?.response![index].goals!.away}',
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
                                                          ?.response![index]
                                                          .teams!
                                                          .away!
                                                          .logo ??
                                                      ""),
                                                  height: 60,
                                                  width: 60,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  livescore!.response![index].teams!
                                                          .away!.name ??
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
                              },
                            ),
                          );
                        } else {
                          return Text('No Live Match');
                      }
                    },
                  ),
                ),
              FutureBuilder(
                future: SeasonleagueClass().getseasonleague(),
                builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Text('no data');
                }else{
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
                                  tema1img:snapshot.data!.response![index].teams!
                                          .home!.logo ??
                                      "",
                                  tema2img: snapshot.data!.response![index].teams!
                                          .away!.logo ??
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
              },)
          ],
        ),
      ),
    );
  }
}
