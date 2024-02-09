import 'package:football/models/damiData/team.dart';
import 'package:football/models/team.dart';
import 'package:football/services/api.dart';

Future<List<Team>> fetchTeam(String name) async {
  return Team.fromJsonList(myList);
  // -----------------------------------------------
  final ret = await api('teams?search=$name');
  if (ret == null) return [];
  return Team.fromJsonList(ret['response']);
}

Future<Team> fetchTeamById(int id) async {
  return Team.fromJson(myList[0]);
  // -----------------------------------------------
  final res = await api('teams?id=$id');
  return Team.fromJson(res['response'][0]);
}
