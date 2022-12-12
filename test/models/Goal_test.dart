import 'package:evryday_goals/database/implementations/GeneralGoals.dart';
import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/database/implementations/TomorrowsGoals.dart';
import 'package:evryday_goals/models/Goal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Goal goal;
  test('Goal changeDoneState altera de true para false', (() {
    goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
    goal.changeDoneState();
    expect(goal.done, false);
  }));

  test('Goal changeDoneState altera de false para true', (() {
    goal = Goal('title', 'description', 'pathToImage', 'urgency', false);
    goal.changeDoneState();
    expect(goal.done, true);
  }));

  test('Goal defineGoalDestination adiciona à TodayGoals', (() {
    goal = Goal('title', 'description', 'pathToImage', 'urgency', false);
    goal.defineGoalDestination('1', goal);
    expect(TodayGoals.l.length, 1);
    TodayGoals.l.removeLast();
  }));

  test('Goal defineGoalDestination adiciona à TomorrowsGoals', (() {
    goal = Goal('title', 'description', 'pathToImage', 'urgency', false);
    goal.defineGoalDestination('2', goal);
    expect(TomorrowsGoals.l.length, 1);
    TomorrowsGoals.l.removeLast();
  }));

  test('Goal defineGoalDestination adiciona à GeneralGoals', (() {
    goal = Goal('title', 'description', 'pathToImage', 'urgency', false);
    goal.defineGoalDestination('3', goal);
    expect(GeneralGoals.l.length, 1);
    GeneralGoals.l.removeLast();
  }));
}
