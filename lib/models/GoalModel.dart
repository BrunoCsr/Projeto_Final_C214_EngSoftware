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
      ),
    );
  }
}
