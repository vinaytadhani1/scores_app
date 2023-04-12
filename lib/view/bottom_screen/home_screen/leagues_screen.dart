import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:score_app/model/leagues_model.dart';
import '../../../model/live_match_model.dart';
import '../../../widget/common.dart';
import 'leagues_seasons.dart';

class Leagues_Screen extends StatefulWidget {
  const Leagues_Screen({super.key});

  @override
  State<Leagues_Screen> createState() => _Leagues_ScreenState();
}

class _Leagues_ScreenState extends State<Leagues_Screen> {
  LeaguesModel? leaguesResponse;
  LiveMatchModel? liveMatchResponse;

  getleagues() async {
    var response = await http.get(
        Uri.parse('https://api-football-v1.p.rapidapi.com/v3/leagues'),
        headers: {
          'x-rapidapi-key': apiKey,
          'x-rapidapi-host': hoostKey,
        });
    var body = json.decode(response.body);
    print(body);
    leaguesResponse = LeaguesModel.fromJson(body);
    print("++++++++++${leaguesResponse?.response[0].league}");
    setState(() {});
  }

  // getliveMatch() async {
  //   var response = await http.get(
  //       Uri.parse('https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all'),
  //       headers: {
  //         'x-rapidapi-key': apiKey,
  //         'x-rapidapi-host': hoostKey,
  //       });
  //   var body = json.decode(response.body);
  //   print(body);
  //   liveMatchResponse = LiveMatchModel.fromJson(body);
  //   print("++++++++++${liveMatchResponse?.response[0].goals}");
  //   setState(() {});
  // }

  @override
  void initState() {
    getleagues();
    // getliveMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: leaguesResponse?.response == null
            ? Center(child: Text('Loading....') ) 
            : ListView.builder(
                itemCount: leaguesResponse?.response.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(leaguesResponse?.response[index].league.name ?? ""),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(leaguesResponse?.response[index].league.logo ?? ""),
                    ),
            );
          },
        ),
      ),
    );
  }
}
