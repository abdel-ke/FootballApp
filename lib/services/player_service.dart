import 'package:football/models/damiData/players.dart';
import 'package:football/models/players.dart';
import 'package:football/services/api.dart';

Future<List<Player>> fetchPlayers(int id) async {
  return Player.fromJsonList(players);
  // ---------------------------------------------------------------------------
  final res = await api('players/squads?team=$id');
  if (res['response'].length == 0) return [];
  return Player.fromJsonList(res['response'][0]['players']);
}

Future<PlayerProfile> fetchPlayerProfile(int id) async {
  // 874 cristiano ronaldo
  return PlayerProfile.fromJson(playerId);
  // ---------------------------------------
  final res = await api('players?id=$id&season=2023');
  if (res['response'].length == 0) return PlayerProfile.empty();
  return PlayerProfile.fromJson(res['response'][0]);
}
