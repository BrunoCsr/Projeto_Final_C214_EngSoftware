// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:evryday_goals/models/goal_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  Color myMainBlue = const Color(0xff343a6b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
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
                                      width: MediaQuery.of(context).size.width *
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
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Descrição',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                        height: 290,
                                        width:
                                            MediaQuery.of(context).size.width *
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
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
                                        onTap: () {},
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
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
                child: ListView(
                  children: [
                    GoalModel(
                        color: Colors.green,
                        title: 'Fazer tarefa de Redes',
                        description: 'description',
                        pathToImage: 'pathToImage',
                        urgency: 2,
                        done: false),
                    GoalModel(
                        color: Colors.blue,
                        title: 'Levar o coisa pra consertar',
                        description: 'description',
                        pathToImage: 'pathToImage',
                        urgency: 2,
                        done: false),
                    GoalModel(
                        color: Colors.green,
                        title: 'Trocar resistência',
                        description: 'description',
                        pathToImage: 'pathToImage',
                        urgency: 2,
                        done: false),
                    GoalModel(
                        color: Colors.yellow,
                        title: 'Jiu-Jitsu',
                        description: 'description',
                        pathToImage: 'pathToImage',
                        urgency: 2,
                        done: true),
                    GoalModel(
                        color: Colors.red,
                        title: 'C214',
                        description: 'description',
                        pathToImage: 'pathToImage',
                        urgency: 2,
                        done: true),
                    GoalModel(
                        color: Colors.red,
                        title: 'Projeto final',
                        description: 'description',
                        pathToImage: 'pathToImage',
                        urgency: 2,
                        done: true)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
