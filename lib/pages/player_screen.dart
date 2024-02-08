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
          // backgroundColor: Theme.of(context).colorScheme.primary,
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

  SingleChildScrollView playerPage(
      BuildContext context, PlayerProfile playerData) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
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

  Wrap detailsCard(BuildContext context, PlayerProfile playerData) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          width: 125,
          margin: const EdgeInsets.all(1),
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
          width: 125,
          margin: const EdgeInsets.all(1),
          height: 100,
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
          width: 125,
          margin: const EdgeInsets.all(1),
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
          width: 125,
          margin: const EdgeInsets.all(1),
          height: 100,
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
          width: 125,
          margin: const EdgeInsets.all(1),
          height: 100,
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
          width: 125,
          margin: const EdgeInsets.all(1),
          height: 100,
          // color: Theme.of(context).colorScheme.primary,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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
      child: Row(
        // alignment: WrapAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(playerData.player.photo),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      width: 30,
                      height: 30,
                      // margin:
                      //     const EdgeInsets.symmetric(horizontal: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            Image.network(playerData.statistics[0].team.logo),
                      ),
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
                      TextSpan(
                        text: '$count',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
