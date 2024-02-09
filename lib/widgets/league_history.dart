import 'package:flutter/material.dart';
import 'package:football/models/players.dart';

class LeagueHistory extends StatelessWidget {
  const LeagueHistory({super.key, required this.statistics});
  final List<Statistics> statistics;

  @override
  Widget build(BuildContext context) {
    statistics.sort((a, b) => b.league.id.compareTo(a.league.id));
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(color: Colors.white, width: 1),
          // border: TableBorder.symmetric(
          // outside: const BorderSide(color: Colors.black, width: 1)),
          headingRowColor: MaterialStateProperty.resolveWith((states) {
            return Colors.orange;
          }),
          columns: <DataColumn>[
            const DataColumn(label: Center(child: Text('League'))),
            const DataColumn(
                label: Center(
              child: Text('name'),
            )),
            const DataColumn(
                label: Center(child: Text('Played')), numeric: true),
            const DataColumn(
                label: Center(child: Text('Goals')), numeric: true),
            const DataColumn(
                label: Center(child: Text('Assists')), numeric: true),
            const DataColumn(
                label: Center(child: Text('Rating')), numeric: true),
            DataColumn(
                numeric: true,
                label: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  width: 15,
                  height: 20,
                )),
            DataColumn(
                numeric: true,
                label: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  width: 15,
                  height: 20,
                )),
          ],
          rows: statistics
              .map((e) => DataRow(
                      // use pair color for each row
                      color: MaterialStateProperty.resolveWith((states) {
                        return statistics.indexOf(e) % 2 == 0
                            ? Colors.orange.shade50
                            : Colors.orange.shade100;
                      }),
                      cells: [
                        DataCell(
                          CircleAvatar(
                            foregroundImage: NetworkImage(e.league.logo),
                          ),
                        ),
                        DataCell(
                            Center(child: Center(child: Text(e.league.name)))),
                        DataCell(Center(
                            child: Text(e.games.appearences.toString()))),
                        DataCell(Center(child: Text(e.goals.toString()))),
                        DataCell(Center(child: Text(e.assists.toString()))),
                        DataCell(Center(
                          child: Center(
                            child: Text(
                              e.games.rating.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                        DataCell(Center(child: Text(e.yellow.toString()))),
                        DataCell(Center(child: Text(e.red.toString()))),
                      ]))
              .toList(),
        ),
      ),
    );
  }
}
