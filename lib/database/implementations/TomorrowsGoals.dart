import '../../models/Goal.dart';
import '../Interfaces/ActionsI.dart';

class TomorrowsGoals implements Actions {
  static List<Goal> l = [];

  @override
  static addToStatic(value) {
    l.add(value);
  }

  @override
  static removeFromStatic(value) {
    l.remove(value);
  }

  @override
  static locateStaticByTitle(String string) {
    for (var i = 0; i < l.length; i++) {
      if (l[i].title == string) {
        return i;
      }
    }
    return -1;
  }

  @override
  void switchh(from, to) {}
}
