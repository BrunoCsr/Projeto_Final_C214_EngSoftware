import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/database/implementations/TomorrowsGoals.dart';

import '../../models/Goal.dart';

class GeneralGoals {
  static List<Goal> l = [];

  static addToStatic(value) {
    l.add(value);
  }

  static removeFromStatic(value) {
    l.remove(value);
  }

  static int getStaticSize() {
    return l.length;
  }

  static String getStaticFirstItemsTitle() {
    return l[0].title.toString();
  }

  static removeLastFromStatic() {
    l.removeLast();
  }

  static locateStaticByTitle(String string) {
    for (var i = 0; i < l.length; i++) {
      if (l[i].title == string) {
        return i;
      }
    }
    return -1;
  }

  static switchThisIndexToTomorrow(int index) {
    TomorrowsGoals.addToStatic(GeneralGoals.l[index]);
    GeneralGoals.removeFromStatic(GeneralGoals.l[index]);
  }

  static switchThisIndexToToday(int index) {
    TodayGoals.addToStatic(GeneralGoals.l[index]);
    GeneralGoals.removeFromStatic(GeneralGoals.l[index]);
  }
}
