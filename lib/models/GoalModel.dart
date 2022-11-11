// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class GoalModel extends StatefulWidget {
  String title;
  String description;
  String pathToImage;
  int urgency;
  bool done;
  final Color color;
  GoalModel(
      {super.key,
      required this.color,
      required this.title,
      required this.description,
      required this.pathToImage,
      required this.urgency,
      required this.done});

  @override
  State<GoalModel> createState() => _GoalModelState();
}

class _GoalModelState extends State<GoalModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            color: Colors.black38,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: double.infinity,
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                        color: Colors.blue,
                        widget.done
                            ? Icons.check_circle
                            : Icons.circle_outlined),
                    Icon(
                      Icons.circle_rounded,
                      color: widget.color,
                    )
                  ],
                )),
            SizedBox(
              height: double.infinity,
              width: 252,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
