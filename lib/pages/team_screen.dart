import 'package:flutter/material.dart';
import 'package:football/models/team.dart';
import 'package:football/widgets/Team_information.dart';
import 'package:football/widgets/current_players.dart';
import 'package:football/widgets/last_matches.dart';
import 'package:football/widgets/next_match.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key, required this.team});
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          centerTitle: true,
          title: const Text(
            'Team Information',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TeamInformation(
                  team: team,
                ),
                NextMatchInfo(id: team.id),
                CurrentPlayers(
                  id: team.id,
                ),
                LastMatchesInfo(id: team.id),
              ],
            ),
          ),
        ));
  }
}
