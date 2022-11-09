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
      ),
    );
    ;
  }
}
