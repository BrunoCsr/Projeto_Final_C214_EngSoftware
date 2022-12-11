import 'package:evryday_goals/database/implementations/GeneralGoals.dart';
import 'package:evryday_goals/models/slide_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Goal.dart';
import '../models/goal_model_two.dart';

class GeneralGoalsPage extends StatefulWidget {
  const GeneralGoalsPage({super.key});

  @override
  State<GeneralGoalsPage> createState() => _GeneralGoalsPageState();
}

class _GeneralGoalsPageState extends State<GeneralGoalsPage> {
  Color myMainBlue = const Color(0xff343a6b);
  String meta = '';
  String title = '';
  String description = '';
  String urgencia = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
              backgroundColor: myMainBlue,
              child: const Icon(Icons.remove),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Apague um meta pelo título'),
                        content: SizedBox(
                          height: 120,
                          width: 50,
                          child: Column(
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 10),
                                  labelText: 'Nome da meta a ser apagada:',
                                ),
                                onChanged: (value) {
                                  meta = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    int deleteThisIndex =
                                        GeneralGoals.locateStaticByTitle(meta);

                                    setState(() {
                                      try {
                                        GeneralGoals.removeFromStatic(
                                            GeneralGoals.l[deleteThisIndex]);
                                        Navigator.pop(context);
                                      } catch (e) {}
                                    });
                                  },
                                  child: const Text('Deletar'))
                            ],
                          ),
                        ),
                      );
                    });
              }),
          FloatingActionButton.small(
            backgroundColor: myMainBlue,
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                    backgroundColor: Colors.black,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => SlideWidget(
                        title: title,
                        description: description,
                        meta: meta,
                        urgencia: urgencia,
                        which: '3'));
              });
            },
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: myMainBlue,
        title: const Text('Metas Gerais'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: myMainBlue,
        child: Center(
          child: Stack(
            children: [
              const Center(
                child: SizedBox(
                  height: 300,
                  width: 350,
                  child: Image(image: AssetImage('lib/assets/MyLogoDog.png')),
                ),
              ),
              SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: GeneralGoals.l.length,
                    itemBuilder: (context, i) {
                      if (GeneralGoals.l.isNotEmpty) {
                        return GoalModelTwo(
                            title: GeneralGoals.l[i].title.toString(),
                            description:
                                GeneralGoals.l[i].description.toString(),
                            pathToImage:
                                GeneralGoals.l[i].pathToImage.toString(),
                            urgency: GeneralGoals.l[i].urgency.toString(),
                            done: GeneralGoals.l[i].done!);
                      } else {
                        return Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.yellow,
                          ),
                        );
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
