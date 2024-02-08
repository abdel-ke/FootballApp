import 'package:flutter/material.dart';
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
    setState(() {
      if (selectedTeams.containsValue(id)) return;
      if (selectedTeams.length == 3) {
        selectedTeams.remove(selectedTeams.keys.first);
      }
      selectedTeams[name] = id;
    });
    // return selectedTeams;
  }

  @override
  Widget build(BuildContext context) {
    searchTeam() async {
      try {
        List<Team> team = await fetchTeam(controller.text);
        if (!context.mounted) return;
        if (team.isNotEmpty) {
          showModalBottomSheet<void>(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              context: context,
              builder: (BuildContext context) {
                return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: team.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          selectTeam(
                              selectedTeams, team[index].name, team[index].id);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TeamScreen(team: team[index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(team[index].logo),
                                ),
                              ),
                              Text(team[index].name),
                            ],
                          ),
                        ),
                      );
                    });
              });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: const Text(
                'Team not found!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              e.toString().substring(11),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text(
            'Football App',
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                          label: Text(e),
                          onDeleted: () {
                            setState(() {
                              selectedTeams.remove(e);
                            });
                          },
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
