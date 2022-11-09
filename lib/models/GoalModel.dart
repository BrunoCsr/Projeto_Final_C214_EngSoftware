// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class GoalModel extends StatefulWidget {
  const GoalModel({super.key});

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
                    Icon(Icons.check_circle),
                    Icon(
                      Icons.circle_rounded,
                    )
                  ],
                )),
            SizedBox(
              height: double.infinity,
              width: 252,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text('Este é o título da nota'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
