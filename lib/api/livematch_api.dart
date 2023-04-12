import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/live_scrore.dart';
import '../widget/common.dart';

class LiveMatchApi {

  Live_Scrore? livescore;
  
  Future<Live_Scrore> getAllliveScore() async {
    var data;
    final result = await http.get(
      Uri.parse('https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': hoostKey,
      },
    );
    if (result.statusCode == 200) {
      print(result.body.toString());
      livescore = Live_Scrore.fromJson(json.decode(result.body));
      // print(livescore!.response![1].goals!.home);
      print("------${livescore!.response![1].goals!.home}------");
    }
    return livescore!;
  }
}
