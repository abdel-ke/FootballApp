import 'package:football/models/damiData/last7matches.dart';
import 'package:football/models/damiData/nextmatch.dart';
import 'package:football/models/matche.dart';
import 'package:football/services/api.dart';

Future<List<LastsMatches>> fetchLastMatches(int id) async {
  return LastsMatches.fromJsonList(lastMatches['response'] as List<dynamic>);
  // ----------------------------------------------------------------
  final res = await api('fixtures?team=$id&last=7');
  if (res['response'].length == 0) return [];
  return LastsMatches.fromJsonList(res['response']);
}

Future<NextMatch> fetchNextMatch(int id) async {
  if ((nextMatch['response'] as List<dynamic>).isEmpty) return NextMatch.empty();
  return NextMatch.fromJson(nextMatch['response'][0]);
  // return NextMatch.fromJson(nextMatch['response'] as List<dynamic>);
  // ---------------------------------------
  final res = await api('fixtures?team=$id&next=1');
  if (res['response'].length == 0) return NextMatch.empty();
  return NextMatch.fromJson(res['response'][0]);
}
