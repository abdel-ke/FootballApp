import 'package:football/models/matche.dart';
import 'package:football/services/api.dart';

Future<List<LastsMatches>> fetchLastMatches(int id) async {
  final res = await api('fixtures?team=$id&last=7');
  if (res['response'].length == 0) return [];
  return LastsMatches.fromJsonList(res['response']);
}

Future<NextMatch> fetchNextMatch(int id) async {
  final res = await api('fixtures?team=$id&next=1');
  if (res['response'].length == 0) return NextMatch.empty();
  return NextMatch.fromJson(res['response'][0]);
}
