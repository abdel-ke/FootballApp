import 'package:football/constant/constants.dart';

class Team {
  final int id;
  final String name;
  final String code;
  final String country;
  final int founded;
  final bool national;
  final String logo;

  Team({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json['team']['id'] ?? 0,
        name: json['team']['name'] ?? '-',
        code: json['team']['code'] ?? '-',
        country: json['team']['country'] ?? '-',
        founded: json['team']['founded'] ?? 0,
        national: json['team']['national'] ?? false,
        logo: json['team']['logo'] ?? emptyImage);
  }

  static List<Team> fromJsonList(List<dynamic> jsonList) {
    List<Team> teams = [];
    for (int i = 0; i < jsonList.length; i++) {
      teams.add(Team.fromJson(jsonList[i]));
    }
    return teams;
  }
}
