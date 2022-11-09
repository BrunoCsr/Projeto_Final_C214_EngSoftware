import 'package:flutter/material.dart';

class GeneralGoalsPage extends StatefulWidget {
  const GeneralGoalsPage({super.key});

  @override
  State<GeneralGoalsPage> createState() => _GeneralGoalsPageState();
}

class _GeneralGoalsPageState extends State<GeneralGoalsPage> {
  Color myMainBlue = const Color(0xff343a6b);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myMainBlue,
        title: Text('Geral'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: myMainBlue,
      ),
    );
    ;
  }
}
