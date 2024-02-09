import 'package:flutter/material.dart';
import 'package:football/models/team.dart';
import 'package:football/widgets/custom_image.dart';

class TeamInformation extends StatelessWidget {
  const TeamInformation({super.key, required this.team});

  final Team team;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CustomImage(logo: team.logo, name: team.name),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              FittedBox(
                child: Text(team.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              FittedBox(
                child: Text(
                  team.country,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              FittedBox(child: Text(team.code)),
            ],
          ),
        ],
      ),
    );
  }
}
