import 'package:football/constant/constants.dart';

class Match {
  final int id;
  final String name;
  final String logo;
  final String winner;

  Match({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
        id: json['id'] ?? 0,
        name: json['name'] ?? '-',
        logo: json['logo'] ?? emptyImage,
        winner: json['winner'].toString());
  }
}

class NextMatch {
  final Match home;
  final Match away;
  final String date;
  final String location;

  NextMatch({
    required this.home,
    required this.away,
    required this.date,
    required this.location,
  });

  NextMatch.empty()
      : home = Match(id: 0, name: '-', logo: emptyImage, winner: '-'),
        away = Match(id: 0, name: '-', logo: emptyImage, winner: '-'),
        date = '-',
        location = '-';

  factory NextMatch.fromJson(Map<String, dynamic> json) {
    return NextMatch(
        home: Match.fromJson(json['teams']['home']),
        away: Match.fromJson(json['teams']['away']),
        date: json['fixture']['date'] ?? '-',
        location: json['fixture']['venue']['name'] ?? '-');
  }
}

class LastsMatches {
  final Match home;
  final Match away;
  final String date;
  final int homeGoals;
  final int awayGoals;
  final String name;
  final String city;

  LastsMatches(
      {required this.home,
      required this.away,
      required this.date,
      required this.homeGoals,
      required this.awayGoals,
      required this.name,
      required this.city});

  factory LastsMatches.fromJson(Map<String, dynamic> json) {
    return LastsMatches(
      home: Match.fromJson(json['teams']['home']),
      away: Match.fromJson(json['teams']['away']),
      date: json['fixture']['date'] ?? '-',
      homeGoals: json['goals']['home'] ?? 0,
      awayGoals: json['goals']['away'] ?? 0,
      name: json['fixture']['venue']['name'] ?? '-',
      city: json['fixture']['venue']['city'] ?? '-',
    );
  }

  static List<LastsMatches> fromJsonList(List<dynamic> jsonList) {
    List<LastsMatches> lastMatches = [];
    for (int i = 0; i < jsonList.length; i++) {
      lastMatches.add(LastsMatches.fromJson(jsonList[i]));
    }
    return lastMatches;
  }
}
