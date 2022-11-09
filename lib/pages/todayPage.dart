// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        onPressed: () {},
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
      ),
    );
    ;
  }
}
