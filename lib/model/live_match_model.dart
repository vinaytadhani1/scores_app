// To parse this JSON data, do
//
//     final liveMatchModel = liveMatchModelFromJson(jsonString);

import 'dart:convert';

LiveMatchModel liveMatchModelFromJson(String str) => LiveMatchModel.fromJson(json.decode(str));

String liveMatchModelToJson(LiveMatchModel data) => json.encode(data.toJson());

class LiveMatchModel {
    LiveMatchModel({
        required this.liveMatchModelGet,
        required this.parameters,
        required this.errors,
        required this.results,
        required this.paging,
        required this.response,
    });

    String liveMatchModelGet;
    Parameters parameters;
    List<dynamic> errors;
    int results;
    Paging paging;
    List<Response> response;

    factory LiveMatchModel.fromJson(Map<String, dynamic> json) => LiveMatchModel(
        liveMatchModelGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": liveMatchModelGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Paging {
    Paging({
        required this.current,
        required this.total,
    });

    int current;
    int total;

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
    };
}

class Parameters {
    Parameters({
        required this.live,
    });

    String live;

    factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        live: json["live"],
    );

    Map<String, dynamic> toJson() => {
        "live": live,
    };
}

class Response {
    Response({
        required this.fixture,
        required this.league,
        required this.teams,
        required this.goals,
        required this.score,
        required this.events,
    });

    Fixture fixture;
    League league;
    Goals teams;
    Goals goals;
    Score score;
    List<dynamic> events;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: Goals.fromJson(json["teams"]),
        goals: Goals.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
        events: List<dynamic>.from(json["events"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture.toJson(),
        "league": league.toJson(),
        "teams": teams.toJson(),
        "goals": goals.toJson(),
        "score": score.toJson(),
        "events": List<dynamic>.from(events.map((x) => x)),
    };
}

class Fixture {
    Fixture({
        required this.id,
        this.referee,
        required this.timezone,
        required this.date,
        required this.timestamp,
        required this.periods,
        required this.venue,
        required this.status,
    });

    int id;
    String? referee;
    String timezone;
    DateTime date;
    int timestamp;
    Periods periods;
    Venue venue;
    Status status;

    factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"],
        timezone: json["timezone"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezone,
        "date": date.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods.toJson(),
        "venue": venue.toJson(),
        "status": status.toJson(),
    };
}

class Periods {
    Periods({
        required this.first,
        this.second,
    });

    int first;
    dynamic second;

    factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
    };
}

class Status {
    Status({
        required this.long,
        required this.short,
        required this.elapsed,
    });

    String long;
    String short;
    int elapsed;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json["long"],
        short: json["short"],
        elapsed: json["elapsed"],
    );

    Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "elapsed": elapsed,
    };
}

class Venue {
    Venue({
        this.id,
        required this.name,
        required this.city,
    });

    int? id;
    String name;
    String city;

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
    };
}

class Goals {
    Goals({
        this.home,
        this.away,
    });

    dynamic home;
    dynamic away;

    factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}

class AwayClass {
    AwayClass({
        required this.id,
        required this.name,
        required this.logo,
        this.winner,
    });

    int id;
    String name;
    String logo;
    dynamic winner;

    factory AwayClass.fromJson(Map<String, dynamic> json) => AwayClass(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        winner: json["winner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "winner": winner,
    };
}

class League {
    League({
        required this.id,
        required this.name,
        required this.country,
        required this.logo,
        this.flag,
        required this.season,
        required this.round,
    });

    int id;
    String name;
    String country;
    String logo;
    String? flag;
    int season;
    String round;

    factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        round: json["round"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round,
    };
}

class Score {
    Score({
        required this.halftime,
        required this.fulltime,
        required this.extratime,
        required this.penalty,
    });

    Goals halftime;
    Goals fulltime;
    Goals extratime;
    Goals penalty;

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: Goals.fromJson(json["halftime"]),
        fulltime: Goals.fromJson(json["fulltime"]),
        extratime: Goals.fromJson(json["extratime"]),
        penalty: Goals.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "halftime": halftime.toJson(),
        "fulltime": fulltime.toJson(),
        "extratime": extratime.toJson(),
        "penalty": penalty.toJson(),
    };
}
