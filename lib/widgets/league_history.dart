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
        // set color for column header

        child: DataTable(
          border: TableBorder.all(color: Colors.black, width: 1),
          headingRowColor: MaterialStateProperty.resolveWith((states) {
            return Colors.white;
          }),
          columns: <DataColumn>[
            const DataColumn(label: Center(child: Text('League'))),
            const DataColumn(
                label: Center(
              child: Text(
                'name',
                textAlign: TextAlign.center,
              ),
            )),
            const DataColumn(label: Center(child: Text('Played'))),
            const DataColumn(label: Center(child: Text('Goals'))),
            const DataColumn(label: Center(child: Text('Assists'))),
            const DataColumn(label: Center(child: Text('Rating'))),
            DataColumn(
                label: Container(
              color: Colors.yellow,
              width: 15,
              height: 20,
            )),
            DataColumn(
                label: Container(
              color: Colors.red,
              width: 15,
              height: 20,
            )),
          ],
          rows: statistics
              .map((e) => DataRow(
                      // use pair color for each row
                      color: MaterialStateProperty.resolveWith((states) {
                        return statistics.indexOf(e) % 2 == 0
                            ? Colors.grey[200]
                            : Colors.white;
                      }),
                      cells: [
                        DataCell(
                          CircleAvatar(
                            backgroundImage: NetworkImage(e.league.logo),
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
