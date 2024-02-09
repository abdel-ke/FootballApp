import 'package:flutter/material.dart';
import 'package:football/models/matche.dart';
import 'package:football/services/match_service.dart';
import 'package:football/widgets/circular_progress.dart';
import 'package:football/widgets/custom_image.dart';
import 'package:football/widgets/error_data.dart';

class LastMatchesInfo extends StatelessWidget {
  const LastMatchesInfo({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchLastMatches(id),
        builder: (context, snaphot) {
          if (snaphot.connectionState == ConnectionState.waiting) {
            return const CircularProgress(height: 400);
          }
          if (snaphot.hasError) {
            return ErrorData(message: snaphot.error.toString(), height: 400);
          }
          if (snaphot.hasData) {
            final List<LastsMatches>? lastMatches = snaphot.data;
            return Container(
                margin: const EdgeInsets.only(top: 10),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(10)),
                // color: Colors.orange.shade100,
                child: ListView.builder(
                    itemCount: lastMatches!.length,
                    itemBuilder: (context, index) {
                      final LastsMatches match = lastMatches[index];
                      return Container(
                        margin: EdgeInsets.only(
                            top: 10,
                            right: 10,
                            left: 10,
                            bottom: index == lastMatches.length - 1 ? 10 : 2),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          // color: Theme.of(context).colorScheme.primary,
                          color: Colors.orange.shade100,
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
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${match.homeGoals}',
                                        style: TextStyle(
                                          color: checkColor(match.home.winner),
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' - ',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${match.awayGoals}',
                                        style: TextStyle(
                                          color: checkColor(match.away.winner),
                                        ),
                                      ),
                                    ],
                                  ),
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
          return const ErrorData(message: 'No data!', height: 400);
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
