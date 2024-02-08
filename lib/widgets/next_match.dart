import 'package:flutter/material.dart';
import 'package:football/models/matche.dart';
import 'package:football/services/match_service.dart';
import 'package:football/widgets/custom_image.dart';

class NextMatchInfo extends StatelessWidget {
  const NextMatchInfo({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchNextMatch(id),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 150,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            print('next error: ${snapshot.error}');
            return Container(
              height: 150,
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
          }
          if (snapshot.hasData) {
            final NextMatch match = snapshot.data!;
            final DateTime date;
            print('date: |${match.date}|');
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
