import 'package:evryday_goals/pages/configsPage.dart';
import 'package:evryday_goals/pages/generalGoalsPage.dart';
import 'package:evryday_goals/pages/performancePage.dart';
import 'package:evryday_goals/pages/todayPage.dart';
import 'package:evryday_goals/pages/tomorrowPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ConfigsPage(),
    GeneralGoalsPage(),
    PerformancePage(),
    TodayPage(),
    TomorrowPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color myMainBlue = const Color(0xff343a6b);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            fixedColor: Colors.blue,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: myMainBlue,
                icon: const Icon(Icons.settings),
                label: "Configurações",
              ),
              BottomNavigationBarItem(
                  backgroundColor: myMainBlue,
                  icon: const Icon(
                    Icons.all_inclusive,
                  ),
                  label: "Metas gerais",
                  tooltip: 'Metas frequentes'),
              BottomNavigationBarItem(
                  backgroundColor: myMainBlue,
                  icon: const Icon(Icons.run_circle),
                  label: "Desempenho"),
              BottomNavigationBarItem(
                  backgroundColor: myMainBlue,
                  icon: const Icon(Icons.warning),
                  label: "Hoje"),
              BottomNavigationBarItem(
                  backgroundColor: myMainBlue,
                  icon: const Icon(Icons.today),
                  label: "Amanhã")
            ]),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}
