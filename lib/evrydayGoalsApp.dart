import 'package:flutter/material.dart';

import 'pages/homePage.dart';

class EvrydayGoalsApp extends StatelessWidget {
  const EvrydayGoalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
