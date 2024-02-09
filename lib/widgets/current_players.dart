import 'package:flutter/material.dart';
import 'package:football/models/players.dart';
import 'package:football/pages/player_screen.dart';
import 'package:football/services/player_service.dart';
import 'package:football/widgets/circular_progress.dart';
import 'package:football/widgets/error_data.dart';

class CurrentPlayers extends StatelessWidget {
  const CurrentPlayers({super.key, required this.id});

  final int id;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPlayers(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgress(
              height: 180,
            );
          } else if (snapshot.hasError) {
            return ErrorData(message: snapshot.error.toString(), height: 180);
          } else {
            final List<Player>? player = snapshot.data;
            if (player == null || player.isEmpty) {
              return const ErrorData(message: 'No data!', height: 180);
            }
            return Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10)),
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
                        margin: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        padding: const EdgeInsets.all(10),
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade300,
                            // color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                player[index].photo,
                                // width: 100,
                              ),
                            ),
                            Text(player[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14)),
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
