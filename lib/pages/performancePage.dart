import 'package:evryday_goals/models/goal_model.dart';
import 'package:flutter/material.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  Widget build(BuildContext context) {
    Color myMainBlue = const Color(0xff343a6b);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myMainBlue,
          title: Text('Seu desempenho'),
          centerTitle: true,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: myMainBlue,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 350,
                  width: 370,
                  child: Image(image: AssetImage('lib/assets/myLogo.png')),
                ),
              ),
            )));
    ;
  }
}
