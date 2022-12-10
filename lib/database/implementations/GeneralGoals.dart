import '../../models/Goal.dart';

class GeneralGoals {
  static List<Goal> l = [];

  static addToStatic(value) {
    l.add(value);
  }

  static removeFromStatic(value) {
    l.remove(value);
  }

  static locateStaticByTitle(String string) {
    for (var i = 0; i < l.length; i++) {
      if (l[i].title == string) {
        return i;
      }
    }
    return -1;
  }
}
