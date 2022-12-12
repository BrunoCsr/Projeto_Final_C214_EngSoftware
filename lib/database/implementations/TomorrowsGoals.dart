import '../../models/Goal.dart';

class TomorrowsGoals {
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

  static int getStaticSize() {
    return l.length;
  }

  static String getStaticFirstItemsTitle() {
    return l[0].title.toString();
  }

  static removeLastFromStatic() {
    l.removeLast();
  }
}
