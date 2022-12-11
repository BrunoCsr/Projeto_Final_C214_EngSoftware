import 'dart:developer';

import 'package:evryday_goals/database/implementations/GeneralGoals.dart';
import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/database/implementations/TomorrowsGoals.dart';
import 'package:evryday_goals/models/Goal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlideWidget extends StatefulWidget {
  String title;
  String description;
  String meta;
  String urgencia;
  String which;

  SlideWidget({
    super.key,
    required this.title,
    required this.description,
    required this.meta,
    required this.urgencia,
    required this.which,
  });

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  Color myMainBlue = const Color(0xff343a6b);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      style:
                          GoogleFonts.lato(fontSize: 25, color: Colors.white),
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
                            width: MediaQuery.of(context).size.width * (3 / 5),
                            decoration: BoxDecoration(
                                color: myMainBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(gapPadding: 10),
                                    labelText: 'Título',
                                  ),
                                  onChanged: (value) {
                                    widget.title = value;
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Descrição',
                                  ),
                                  onChanged: (value) =>
                                      widget.description = value,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Urgência (1,2 ou 3)',
                                  ),
                                  onChanged: (value) => widget.urgencia = value,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 290,
                              width:
                                  MediaQuery.of(context).size.width * (2 / 5) -
                                      28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: myMainBlue),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                        Icons.add_photo_alternate_rounded)),
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
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.title != '' &&
                                      widget.description != '') {
                                    Goal goal = Goal(
                                      widget.title,
                                      widget.description,
                                      'pathToImage',
                                      widget.urgencia,
                                      false,
                                    );

                                    if (widget.which == '1') {
                                      TodayGoals.addToStatic(goal);
                                    } else if (widget.which == '2') {
                                      TomorrowsGoals.addToStatic(goal);
                                    } else if (widget.which == '3') {
                                      GeneralGoals.addToStatic(goal);
                                    }

                                    Navigator.pop(context);
                                  } else {}
                                });
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                'Salvar em metas gerais',
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Goal goal = Goal(
                                  widget.title,
                                  widget.description,
                                  'pathToImage',
                                  widget.urgencia,
                                  false,
                                );
                                GeneralGoals.addToStatic(goal);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
