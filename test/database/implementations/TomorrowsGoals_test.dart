import 'package:evryday_goals/database/implementations/TomorrowsGoals.dart';
import 'package:evryday_goals/models/Goal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes para a classe TomorrowsGoals', (() {
    test('Lista começa vazia', (() {
      expect(TomorrowsGoals.l.length, 0);
    }));

    test('TodayGoals.addToStatic adiciona um item à lista', (() {
      Goal goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
      TomorrowsGoals.addToStatic(goal);

      expect(TomorrowsGoals.l.length, 1);
    }));

    test('TomorrowsGoals removeLastFromStatic remove o último item da lista',
        (() {
      TomorrowsGoals.removeLastFromStatic();
      expect(TomorrowsGoals.l.length, 0);
    }));

    test('TomorrowsGoals removeFromStatic remove o item da lista', (() {
      Goal goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
      TomorrowsGoals.addToStatic(goal);
      TomorrowsGoals.removeFromStatic(goal);
      expect(TomorrowsGoals.l.length, 0);
    }));

    test(
        'TomorrowsGoals.removeLastFromStatic lança excessão quando a lista está vazia',
        (() {
      expect(() => TomorrowsGoals.removeLastFromStatic(),
          throwsA(isA<RangeError>()));
    }));

    test('TomorrowsGoals LocateStaticByTitle retorna o valor correto', (() {
      Goal goal0 =
          Goal('abcde', 'description', 'pathToImage', 'urgency', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      int firstIndex = 0;
      int secondIndex = 0;

      TomorrowsGoals.addToStatic(goal22);
      TomorrowsGoals.addToStatic(goal0);

      firstIndex = TomorrowsGoals.locateStaticByTitle(goal0.title.toString());
      secondIndex = TomorrowsGoals.locateStaticByTitle(goal22.title.toString());

      expect(firstIndex, 1);
      expect(secondIndex, 0);

      for (var i = 0; i < 2; i++) {
        TomorrowsGoals.removeLastFromStatic();
      }
    }));

    test('TodayGoals LocateStaticByTitle retorna -1 se não encontrar o item',
        (() {
      Goal goal0 = Goal('abcde', 'description', 'pathToImage', 'u', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      int firstIndex = 0;
      TomorrowsGoals.addToStatic(goal0);

      firstIndex = TomorrowsGoals.locateStaticByTitle(goal22.title.toString());

      expect(firstIndex, -1);

      TomorrowsGoals.removeLastFromStatic();
    }));

    test(
        'TomorrowsGoals retorna o valor correto para o número de itens na lista',
        (() {
      expect(TomorrowsGoals.getStaticSize(), 0);
    }));

    test('TomorrowsGoals getStaticFirstItemsTitle', (() {
      Goal goal0 = Goal('abcde', 'description', 'pathToImage', 'u', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      TomorrowsGoals.addToStatic(goal0);
      TomorrowsGoals.addToStatic(goal22);

      expect(TomorrowsGoals.getStaticFirstItemsTitle(), goal0.title);

      for (var i = 0; i < 2; i++) {
        TomorrowsGoals.removeLastFromStatic();
      }
    }));
  }));
}
