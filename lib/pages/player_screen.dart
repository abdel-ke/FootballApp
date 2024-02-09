import 'package:flutter/material.dart';
import 'package:football/models/players.dart';
import 'package:football/services/player_service.dart';
import 'package:football/widgets/league_history.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key, required this.playerId});
  final int playerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          centerTitle: true,
          title: const Text('Player Information'),
        ),
        body: FutureBuilder(
            future: fetchPlayerProfile(playerId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: FittedBox(
                    child: Text('Error: ${snapshot.error}',
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                );
              }
              return playerPage(context, snapshot.data as PlayerProfile);
            }));
  }

  SafeArea playerPage(BuildContext context, PlayerProfile playerData) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              playerProfile(context, playerData),
              detailsCard(context, playerData),
              LeagueHistory(statistics: playerData.statistics),
            ],
          ),
        ),
      ),
    );
  }

  Container playerProfile(BuildContext context, PlayerProfile playerData) {
    int count = 0;
    for (var element in playerData.statistics) {
      count += element.goals;
    }
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              playerData.player.photo,
              width: 100,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  playerData.player.name,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      playerData.statistics[0].team.logo,
                      width: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FittedBox(
                    child: Text(
                      playerData.statistics[0].team.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.home_outlined,
                        size: 20,
                      ), // Replace with your preferred icon
                    ),
                    const WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                      text: playerData.player.national,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.sports_soccer,
                        size: 20,
                      ), // Replace with your preferred icon
                    ),
                    const WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                      text: '$count',
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // this function creates a card that has Height, Weight, Age, Team, Position, and Birth Date
  Wrap detailsCard(BuildContext context, PlayerProfile playerData) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        playerCardHelper(context, 'Height', playerData.player.height),
        playerCardHelper(context, 'Weight', playerData.player.weight),
        playerCardHelper(context, 'Age', '${playerData.player.age}'),
        playerCardHelper(context, 'Team', playerData.statistics[0].team.name),
        playerCardHelper(
            context, 'Position', playerData.statistics[0].games.position),
        playerCardHelper(context, 'Birth Date', playerData.player.date),
      ],
    );
  }

  // this function creates a card that has Height, Weight, Age, Team, Position, and Birth Date
  Container playerCardHelper(BuildContext context, String name, String value) {
    return Container(
      width: 120,
      height: 100,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          FittedBox(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
