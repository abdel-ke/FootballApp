import 'package:flutter/material.dart';
import 'package:football/models/players.dart';
import 'package:football/pages/player_screen.dart';
import 'package:football/services/player_service.dart';

class CurrentPlayers extends StatelessWidget {
  const CurrentPlayers({super.key, required this.id});

  final int id;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPlayers(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 180,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              height: 180,
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: FittedBox(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              )),
            );
          } else {
            final List<Player>? player = snapshot.data;
            if (player == null || player.isEmpty) {
              return const SizedBox(
                height: 180,
                child: Center(
                  child: Text('No players'),
                ),
              );
            }
            return SizedBox(
              height: 180,
              child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlayerScreen(playerId: player[index].id)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, top: 10),
                        padding: const EdgeInsets.all(10),
                        width: 120,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(player[index].photo),
                            ),
                            Text(
                              player[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        });
  }
}
