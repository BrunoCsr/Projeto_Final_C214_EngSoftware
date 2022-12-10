import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/models/Goal.dart';
import 'package:evryday_goals/models/goal_model_two.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: Icon(Icons.remove),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Apague um meta pelo título'),
                        content: Container(
                          height: 120,
                          width: 50,
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(gapPadding: 10),
                                  labelText: 'Nome da meta a ser apagada:',
                                ),
                                onChanged: (value) {
                                  meta = value;
                                },
                              ),
                              SizedBox(
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
                                  child: Text('Deletar'))
                            ],
                          ),
                        ),
                      );
                    });
              }),
          FloatingActionButton.small(
            backgroundColor: myMainBlue,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.black,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                          decoration: BoxDecoration(
                              color: myMainBlue,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              )),
                          height: 450,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 80,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: myMainBlue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 35),
                                  child: Text(
                                    'Adicione uma nova meta para hoje',
                                    style: GoogleFonts.lato(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 290,
                                  width: double.infinity,
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 290,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              (3 / 5),
                                          decoration: BoxDecoration(
                                              color: myMainBlue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      gapPadding: 10),
                                                  labelText: 'Título',
                                                ),
                                                onChanged: (value) {
                                                  title = value;
                                                },
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Descrição',
                                                ),
                                                onChanged: (value) =>
                                                    description = value,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      'Urgência (1,2 ou 3)',
                                                ),
                                                onChanged: (value) =>
                                                    urgencia = value,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                            height: 290,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    (2 / 5) -
                                                28,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: myMainBlue),
                                            child: Center(
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .add_photo_alternate_rounded)),
                                            ))
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 75,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              'Salvar aqui',
                                              style: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (title != '' &&
                                                  description != '') {
                                                Goal goal = Goal(
                                                  title,
                                                  description,
                                                  'pathToImage',
                                                  urgencia,
                                                  false,
                                                );
                                                setState(() {
                                                  goal.setColor();
                                                  TodayGoals.addToStatic(goal);

                                                  Navigator.pop(context);
                                                });
                                              } else {}
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              'Salvar em metas gerais',
                                              style: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))));
            },
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: myMainBlue,
        title: Text('Metas de hoje'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: myMainBlue,
        child: Center(
          child: Stack(
            children: [
              Center(
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
