import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/models/goal_model_two.dart';
import 'package:evryday_goals/models/slide_widget.dart';
import 'package:flutter/material.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  Color myMainBlue = const Color(0xff343a6b);
  TodayGoals todayGoals = TodayGoals();
  String title = '';
  String description = '';
  String meta = '';
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
                                        TodayGoals.locateStaticByTitle(meta);

                                    setState(() {
                                      try {
                                        TodayGoals.removeFromStatic(
                                            TodayGoals.l[deleteThisIndex]);
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
                          which: '1',
                        ));
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
        title: const Text('Metas de hoje'),
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
                    itemCount: TodayGoals.l.length,
                    itemBuilder: (context, i) {
                      if (TodayGoals.l.isNotEmpty) {
                        return GoalModelTwo(
                            title: TodayGoals.l[i].title.toString(),
                            description: TodayGoals.l[i].description.toString(),
                            pathToImage: TodayGoals.l[i].pathToImage.toString(),
                            urgency: TodayGoals.l[i].urgency.toString(),
                            done: TodayGoals.l[i].done!);
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
    ;
  }
}
