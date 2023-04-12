// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_app/widget/common.dart';

import '../../../model/live_scrore.dart';

class LiveMatch_Screen extends StatefulWidget {
  Responsee? response;
  LiveMatch_Screen({
    Key? key,
    this.response,
  }) : super(key: key);

  @override
  State<LiveMatch_Screen> createState() => _LiveMatch_ScreenState();
}

class _LiveMatch_ScreenState extends State<LiveMatch_Screen> {
  int current = 0;

  List<String> items = [
    "Stats",
    "Summary",
    "Lineups",
    "H2H",
    "Post",
    "Tables",
    "Stats",
    "Summary",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blackGrey,
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    clipBehavior: Clip.none,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: Color(0xFF37003C),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: AssetImage(
                        "assets/Mask Group.png",
                      ),
                      fit: BoxFit.cover,
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage('assets/Arrow Left.png'),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Premier League',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage('assets/more.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    // height: 180,
                    width: 320,
                    margin: EdgeInsets.all(22),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0xff2C2C2E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Text(
                                  widget.response!.fixture!.venue!.name??"",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Image(
                                      image: NetworkImage( widget.response!.teams!.home!.logo??""),
                                      height: 60,
                                      width: 60,
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        widget.response!.teams!.home!.name??"",overflow: TextOverflow.fade,maxLines: 1,softWrap: false,
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
                                      "${widget.response!.goals!.home} : ${widget.response!.goals!.away}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 28),
                                    ),
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xff00C566).withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(14),
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
                                      image:
                                          NetworkImage(widget.response!.teams!.away!.logo??""),
                                      height: 60,
                                      width: 60,
                                    ),
                                    SizedBox(height: 5),
                                    Container(width: 100,
                                      child: Text(
                                        widget.response!.teams!.away!.name??"",overflow: TextOverflow.fade,maxLines: 1,softWrap: false,
                                        style: TextStyle(
                                          color: Colors.white,overflow: TextOverflow.ellipsis,
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
                ),
              ],
            ),
            SizedBox(height: 115),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(left: 12),
                          padding: const EdgeInsets.all(10),
                          // width: 80,
                          // height: 45,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Color(0xffFF2882)
                                : Color(0xff2C2C2E).withOpacity(0.7),
                            borderRadius: current == index
                                ? BorderRadius.circular(24)
                                : BorderRadius.circular(24),
                            border: current == index
                                ? null
                                : Border.all(
                                    color: Color(0xff8E8E93), width: 1),
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: current == index
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(6),
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/simcard.png'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.8,
                            height: MediaQuery.of(context).size.height / 15,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "90'+5'",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF00C566),
                            ),
                          ),
                          Text(
                            "Lisandro Martinez",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            "Yellow Card",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(6),
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/Football.png'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.8,
                            height: MediaQuery.of(context).size.height / 15,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "90'+4'",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF00C566),
                            ),
                          ),
                          Text(
                            "Casemiro",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            "Goal",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(6),
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/Football.png'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.8,
                            height: MediaQuery.of(context).size.height / 15,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "90'+2'",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF00C566),
                            ),
                          ),
                          Text(
                            "Jorginho",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            "Yellow Card",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(6),
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/simcard.png'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.8,
                            height: MediaQuery.of(context).size.height / 15,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "90'",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF00C566),
                            ),
                          ),
                          Text(
                            "L. Shaw",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            "Yellow Card",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(6),
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/Football.png'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.8,
                            height: MediaQuery.of(context).size.height / 15,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "87'",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0XFF00C566),
                            ),
                          ),
                          Text(
                            "Jorginho",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            "Yellow Card",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
