import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:score_app/model/today_match.dart';
import 'package:score_app/widget/common.dart';

class SeasonleagueClass {
  TodayMatchModel? seasonLeague;
  Future<TodayMatchModel> getseasonleague() async {
    var data;
    final result = await http.get(
      Uri.parse('https://api-football-v1.p.rapidapi.com/v3/fixtures?season=2022&league=39'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': hoostKey,
      },
    );
    if (result.statusCode == 200) {
    //  print(result.body.toString());
      seasonLeague = TodayMatchModel.fromJson(json.decode(result.body));
      print(seasonLeague!.results);
    }
    return seasonLeague!;
  }
}