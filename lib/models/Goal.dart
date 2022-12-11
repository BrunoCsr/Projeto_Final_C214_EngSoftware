import 'package:flutter/material.dart';

import '../database/implementations/GeneralGoals.dart';
import '../database/implementations/TodaysGoals.dart';
import '../database/implementations/TomorrowsGoals.dart';

class Goal {
  String? title;
  String? description;
  String? pathToImage;
  String urgency;
  bool? done;
  Color? color;

  Goal(
    this.title,
    this.description,
    this.pathToImage,
    this.urgency,
    this.done,
  );

  void changeDoneState() {
    done != done;
  }

  void defineGoalDestination(which, goal) {
    if (which == '1') {
      TodayGoals.addToStatic(goal);
    } else if (which == '2') {
      TomorrowsGoals.addToStatic(goal);
    } else if (which == '3') {
      GeneralGoals.addToStatic(goal);
    }
  }

  void setColor() {
    if (urgency == '1') {
      color = Colors.blue;
    } else if (urgency == '2') {
      color == Colors.yellow;
    } else if (urgency == '3') {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
  }
}
