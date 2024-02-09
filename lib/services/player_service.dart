import 'package:football/models/players.dart';
import 'package:football/services/api.dart';

Future<List<Player>> fetchPlayers(int id) async {
  final res = await api('players/squads?team=$id');
  if (res['response'].length == 0) return [];
  return Player.fromJsonList(res['response'][0]['players']);
}

Future<PlayerProfile> fetchPlayerProfile(int id) async {
  final res = await api('players?id=$id&season=2023');
  if (res['response'].length == 0) return PlayerProfile.empty();
  return PlayerProfile.fromJson(res['response'][0]);
}
