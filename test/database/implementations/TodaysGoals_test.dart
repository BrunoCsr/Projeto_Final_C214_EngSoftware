import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/models/Goal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes para a classe TodayGoals', (() {
    test('Lista começa vazia', (() {
      expect(TodayGoals.l.length, 0);
    }));

    test('TodayGoals.addToStatic adiciona um item à lista', (() {
      Goal goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
      TodayGoals.addToStatic(goal);

      expect(TodayGoals.l.length, 1);
    }));

    test('TodayGoals removeLastFromStatic remove o último item da lista', (() {
      TodayGoals.removeLastFromStatic();
      expect(TodayGoals.l.length, 0);
    }));

    test('TodayGoals removeFromStatic remove o item da lista', (() {
      Goal goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
      TodayGoals.addToStatic(goal);
      TodayGoals.removeFromStatic(goal);
      expect(TodayGoals.l.length, 0);
    }));

    test(
        'TodayGoals.removeLastFromStatic lança excessão quando a lista está vazia',
        (() {
      expect(
          () => TodayGoals.removeLastFromStatic(), throwsA(isA<RangeError>()));
    }));

    test('TodayGoals LocateStaticByTitle retorna o valor correto', (() {
      Goal goal0 =
          Goal('abcde', 'description', 'pathToImage', 'urgency', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      int firstIndex = 0;
      int secondIndex = 0;

      TodayGoals.addToStatic(goal22);
      TodayGoals.addToStatic(goal0);

      firstIndex = TodayGoals.locateStaticByTitle(goal0.title.toString());
      secondIndex = TodayGoals.locateStaticByTitle(goal22.title.toString());

      expect(firstIndex, 1);
      expect(secondIndex, 0);

      for (var i = 0; i < 2; i++) {
        TodayGoals.removeLastFromStatic();
      }
    }));

    test('TodayGoals LocateStaticByTitle retorna -1 se não encontrar o item',
        (() {
      Goal goal0 = Goal('abcde', 'description', 'pathToImage', 'u', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      int firstIndex = 0;
      TodayGoals.addToStatic(goal0);

      firstIndex = TodayGoals.locateStaticByTitle(goal22.title.toString());

      expect(firstIndex, -1);

      TodayGoals.removeLastFromStatic();
    }));

    test('TodayGoals retorna o valor correto para o número de itens na lista',
        (() {
      expect(TodayGoals.getStaticSize(), 0);
    }));

    test('TodayGoals getStaticFirstItemsTitle', (() {
      Goal goal0 = Goal('abcde', 'description', 'pathToImage', 'u', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      TodayGoals.addToStatic(goal0);
      TodayGoals.addToStatic(goal22);

      expect(TodayGoals.getStaticFirstItemsTitle(), goal0.title);

      for (var i = 0; i < 2; i++) {
        TodayGoals.removeLastFromStatic();
      }
    }));
  }));
}
