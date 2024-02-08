import 'package:flutter/material.dart';
import 'package:football/models/matche.dart';
import 'package:football/services/match_service.dart';
import 'package:football/widgets/custom_image.dart';

class LastMatchesInfo extends StatelessWidget {
  const LastMatchesInfo({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchLastMatches(id),
        builder: (context, snaphot) {
          if (snaphot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snaphot.hasError) {
            print('Last error: ${snaphot.error}');
            return Container(
              height: 400,
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: FittedBox(
                  child: Text(
                    'Error: ${snaphot.error}',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }
          if (snaphot.hasData) {
            final List<LastsMatches>? lastMatches = snaphot.data;
            return Container(
                margin: const EdgeInsets.only(top: 10),
                height: 400,
                child: ListView.builder(
                    itemCount: lastMatches!.length,
                    itemBuilder: (context, index) {
                      final LastsMatches match = lastMatches[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CustomImage(
                                  logo: match.home.logo, name: match.home.name),
                            ),
                            Expanded(
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      match.homeGoals.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: checkColor(match.home.winner)),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      '-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      match.awayGoals.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: checkColor(match.away.winner)),
                                    ),
                                  ],
                                ),
                                FittedBox(
                                    child: Text(match.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))),
                                FittedBox(
                                    child: Text(match.city,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ]),
                            ),
                            Expanded(
                              child: CustomImage(
                                  logo: match.away.logo, name: match.away.name),
                            ),
                          ],
                        ),
                      );
                    }));
          }
          return const Center(
              child: SizedBox(
            height: 400,
            child: Text('No data',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ));
        });
  }
}

Color checkColor(String winner) {
  return winner == 'true'
      ? Colors.green
      : winner == 'false'
          ? Colors.red
          : Colors.grey.shade900;
}
