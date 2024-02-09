import 'package:football/constant/constants.dart';

class Player {
  final int id;
  final String name;
  final int age;
  final int number;
  final String position;
  final String photo;

  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        id: json['id'] ?? 0,
        name: json['name'] ?? '-',
        age: json['age'] ?? '-',
        number: json['number'] ?? 0,
        position: json['position'] ?? '-',
        photo: json['photo'] ?? emptyImage);
  }

  static List<Player> fromJsonList(List<dynamic> jsonList) {
    List<Player> players = [];
    for (int i = 0; i < jsonList.length; i++) {
      players.add(Player.fromJson(jsonList[i]));
    }
    return players;
  }
}

class PlayerInfo {
  final int id;
  final String name;
  final String photo;
  final int age;
  final String date;
  final String national;
  final String height;
  final String weight;

  PlayerInfo({
    required this.id,
    required this.name,
    required this.photo,
    required this.age,
    required this.date,
    required this.national,
    required this.height,
    required this.weight,
  });

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
      id: json['id'] ?? 0,
      name: json['name'] ?? '-',
      photo: json['photo'] ?? emptyImage,
      age: json['age'] ?? 0,
      date: json['birth']['date'] ?? '-',
      national: json['nationality'] ?? '-',
      height: json['height'] ?? '-',
      weight: json['weight'] ?? '-',
    );
  }
}

class TeamPlayer {
  final int id;
  final String name;
  final String logo;

  TeamPlayer({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory TeamPlayer.fromJson(Map<String, dynamic> json) {
    return TeamPlayer(
      id: json['id'] ?? 0,
      name: json['name'] ?? '-',
      logo: json['logo'] ?? emptyImage,
    );
  }
}

class League {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'] ?? 0,
      name: json['name'] ?? '-',
      country: json['country'] ?? '-',
      logo: json['logo'] ?? emptyImage,
      flag: json['flag'] ?? '-',
    );
  }
}

class Game {
  final int appearences;
  final int lineups;
  final int minutes;
  final int number;
  final String position;
  final String rating;
  final bool captain;

  Game({
    required this.appearences,
    required this.lineups,
    required this.minutes,
    required this.number,
    required this.position,
    required this.rating,
    required this.captain,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      appearences: json['appearences'] ?? 0,
      lineups: json['lineups'] ?? 0,
      minutes: json['minutes'] ?? 0,
      number: json['number'] ?? 0,
      position: json['position'] ?? '-',
      rating: json['rating'] ?? '-',
      captain: json['captain'] ?? false,
    );
  }
}

class Statistics {
  final TeamPlayer team;
  final League league;
  final Game games;
  final int goals;
  final int assists;
  final int yellow;
  final int red;
  final int yellowRed;

  Statistics({
    required this.team,
    required this.league,
    required this.games,
    required this.goals,
    required this.assists,
    required this.yellow,
    required this.red,
    required this.yellowRed,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      team: TeamPlayer.fromJson(json['team']),
      league: League.fromJson(json['league']),
      games: Game.fromJson(json['games']),
      goals: json['goals']['total'] ?? 0,
      assists: json['goals']['assists'] ?? 0,
      yellow: json['cards']['yellow'] ?? 0,
      red: json['cards']['red'] ?? 0,
      yellowRed: json['cards']['yellowRed'] ?? 0,
    );
  }

  static List<Statistics> fromJsonList(List<dynamic> jsonList) {
    List<Statistics> statistics = [];
    for (int i = 0; i < jsonList.length; i++) {
      statistics.add(Statistics.fromJson(jsonList[i]));
    }
    return statistics;
  }
}

class PlayerProfile {
  final PlayerInfo player;
  final List<Statistics> statistics;

  PlayerProfile({
    required this.player,
    required this.statistics,
  });

  PlayerProfile.empty()
      : player = PlayerInfo(
          id: 0,
          name: '-',
          photo: emptyImage,
          age: 0,
          date: '-',
          national: '-',
          height: '-',
          weight: '-',
        ),
        statistics = [];

  factory PlayerProfile.fromJson(Map<String, dynamic> json) {
    return PlayerProfile(
      player: PlayerInfo.fromJson(json['player']),
      statistics: Statistics.fromJsonList(json['statistics']),
    );
  }
}
