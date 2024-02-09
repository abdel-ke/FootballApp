import 'package:football/models/team.dart';
import 'package:football/services/api.dart';

Future<List<Team>> fetchTeam(String name) async {
  final ret = await api('teams?search=$name');
  if (ret == null) return [];
  return Team.fromJsonList(ret['response']);
}

Future<Team> fetchTeamById(int id) async {
  final res = await api('teams?id=$id');
  return Team.fromJson(res['response'][0]);
}
