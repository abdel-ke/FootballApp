import 'package:flutter/material.dart';
import 'package:football/helper/custom_snack_bar.dart';
import 'package:football/models/team.dart';
import 'package:football/pages/team_screen.dart';
import 'package:football/services/team_service.dart';
import 'package:football/widgets/my_button.dart';
import 'package:football/widgets/my_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  Map<String, int> selectedTeams = {};

  selectTeam(Map<String, int> selectedTeams, String name, int id) {
    if (selectedTeams.containsValue(id)) return;
    if (selectedTeams.length == 3) {
      selectedTeams.remove(selectedTeams.keys.first);
    }
    setState(() {
      selectedTeams[name] = id;
    });
  }

  searchTeam() async {
    try {
      List<Team> team = await fetchTeam(controller.text);
      if (!context.mounted) return;
      if (team.isNotEmpty) {
        modalSheet(context, team, controller);
      } else {
        customSnackBar(context, 'Team not found!', 2);
      }
    } catch (e) {
      customSnackBar(context, e.toString().substring(11), 4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 227, 209),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text(
            'Football App',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/hero_banner.png',
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: controller,
                  hintText: 'Search for a team',
                  margin: 42,
                  onSubmitted: (controller) async {
                    await searchTeam();
                  }),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                  title: 'Search',
                  onTap: () async {
                    await searchTeam();
                  }),
              Wrap(
                children: [
                  ...selectedTeams.keys.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            final Team team =
                                await fetchTeamById(selectedTeams[e]!);
                            if (!context.mounted) return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TeamScreen(team: team)));
                          },
                          child: Chip(
                              backgroundColor:
                                  Colors.orange.shade100.withOpacity(0.5),
                              label: Text(
                                e,
                                style: const TextStyle(
                                    // color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                              onDeleted: () {
                                setState(() {
                                  selectedTeams.remove(e);
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.orange),
                              )),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> modalSheet(
      BuildContext context, List<Team> team, TextEditingController controller) {
    return showModalBottomSheet<void>(
        backgroundColor: Colors.orange.shade50,
        context: context,
        builder: (BuildContext context) {
          return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: team.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectTeam(selectedTeams, team[index].name, team[index].id);
                    Navigator.pop(context);
                    controller.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TeamScreen(team: team[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              team[index].logo,
                              width: 80,
                            ),
                          ),
                        ),
                        Text(team[index].name),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
