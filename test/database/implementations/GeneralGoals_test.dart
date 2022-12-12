import 'package:evryday_goals/database/implementations/GeneralGoals.dart';
import 'package:evryday_goals/database/implementations/TodaysGoals.dart';
import 'package:evryday_goals/models/Goal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes para a classe GeneralGoals', (() {
    test('Lista começa vazia', (() {
      expect(GeneralGoals.l.length, 0);
    }));

    test('GeneralGoals.addToStatic adiciona um item à lista', (() {
      Goal goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
      GeneralGoals.addToStatic(goal);

      expect(GeneralGoals.l.length, 1);
    }));

    test('GeneralGoals removeLastFromStatic remove o último item da lista',
        (() {
      GeneralGoals.removeLastFromStatic();
      expect(GeneralGoals.l.length, 0);
    }));

    test('GeneralGoals removeFromStatic remove o item da lista', (() {
      Goal goal = Goal('title', 'description', 'pathToImage', 'urgency', true);
      GeneralGoals.addToStatic(goal);
      GeneralGoals.removeFromStatic(goal);
      expect(GeneralGoals.l.length, 0);
    }));

    test(
        'GeneralGoals.removeLastFromStatic lança excessão quando a lista está vazia',
        (() {
      expect(() => GeneralGoals.removeLastFromStatic(),
          throwsA(isA<RangeError>()));
    }));

    test('GeneralGoals LocateStaticByTitle retorna o valor correto', (() {
      Goal goal0 =
          Goal('abcde', 'description', 'pathToImage', 'urgency', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      int firstIndex = 0;
      int secondIndex = 0;

      GeneralGoals.addToStatic(goal22);
      GeneralGoals.addToStatic(goal0);

      firstIndex = GeneralGoals.locateStaticByTitle(goal0.title.toString());
      secondIndex = GeneralGoals.locateStaticByTitle(goal22.title.toString());

      expect(firstIndex, 1);
      expect(secondIndex, 0);

      for (var i = 0; i < 2; i++) {
        GeneralGoals.removeLastFromStatic();
      }
    }));

    test('GeneralGoals LocateStaticByTitle retorna -1 se não encontrar o item',
        (() {
      Goal goal0 = Goal('abcde', 'description', 'pathToImage', 'u', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      int firstIndex = 0;
      GeneralGoals.addToStatic(goal0);

      firstIndex = GeneralGoals.locateStaticByTitle(goal22.title.toString());

      expect(firstIndex, -1);

      GeneralGoals.removeLastFromStatic();
    }));

    test('GeneralGoals retorna o valor correto para o número de itens na lista',
        (() {
      expect(GeneralGoals.getStaticSize(), 0);
    }));

    test('GeneralGoals getStaticFirstItemsTitle', (() {
      Goal goal0 = Goal('abcde', 'description', 'pathToImage', 'u', false);
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      GeneralGoals.addToStatic(goal0);
      GeneralGoals.addToStatic(goal22);

      expect(GeneralGoals.getStaticFirstItemsTitle(), goal0.title);

      for (var i = 0; i < 2; i++) {
        GeneralGoals.removeLastFromStatic();
      }
    }));

    test('GeneralGoals switchThisIndexToToday faz a troca corretamente', (() {
      Goal goal22 = Goal('titulo', 'description', 'pathToImage', '', true);
      GeneralGoals.addToStatic(goal22);
      expect(TodayGoals.l.length, 0);
      GeneralGoals.switchThisIndexToToday(0);
      expect(TodayGoals.l.length, 1);
      expect(GeneralGoals.l.length, 0);
    }));
    test(
        'GeneralGoals switchThisIndexToToday lança excessão se não houver nada na lista',
        (() {
      expect(() => GeneralGoals.switchThisIndexToToday(33),
          throwsA(isA<RangeError>()));
    }));
  }));
}
