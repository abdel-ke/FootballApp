import 'package:flutter/material.dart';
import 'package:football/models/matche.dart';
import 'package:football/services/match_service.dart';
import 'package:football/widgets/circular_progress.dart';
import 'package:football/widgets/custom_image.dart';
import 'package:football/widgets/error_data.dart';

class NextMatchInfo extends StatelessWidget {
  const NextMatchInfo({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchNextMatch(id),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgress(height: 150);
          }
          if (snapshot.hasError) {
            return ErrorData(message: snapshot.error.toString(), height: 150);
          }
          if (snapshot.hasData) {
            final NextMatch match = snapshot.data!;
            final DateTime date;

            if (match.date != '-') {
              date = DateTime.parse(match.date);
            } else {
              date = DateTime.now();
            }
            return Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: CustomImage(
                            logo: match.home.logo, name: match.home.name)),
                    Expanded(
                      child: Column(
                        children: [
                          if (match.date != '-')
                            Text('${date.day}/${date.month}'),
                          if (match.date != '-')
                            Text('${date.hour}:${date.minute}'),
                          FittedBox(
                              child: Text(
                            match.location,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                        child: CustomImage(
                            logo: match.away.logo, name: match.away.name)),
                  ],
                ));
          }
          return const SizedBox();
        }));
  }
}
