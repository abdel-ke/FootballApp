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
          backgroundColor: Colors.orange,
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
        color: Colors.orange.shade200,
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

  Wrap detailsCard(BuildContext context, PlayerProfile playerData) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          width: 120,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Height'),
              Text(
                playerData.player.height,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 100,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Weight'),
              Text(
                playerData.player.weight,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 100,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Age'),
              Text(
                playerData.player.age.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 100,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(child: Text('Team')),
              FittedBox(
                child: Text(
                  playerData.statistics[0].team.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 100,
          margin: const EdgeInsets.all(1),
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(child: Text('Position')),
              FittedBox(
                child: Text(
                  playerData.statistics[0].games.position,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(1),
          width: 120,
          height: 100,
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.primary,
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          // appearences
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(child: Text('Birth Date')),
              FittedBox(
                child: Text(
                  // playerData.statistics[0].games.appearences.toString(),
                  playerData.player.date,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
