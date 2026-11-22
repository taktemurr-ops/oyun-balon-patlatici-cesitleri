import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_balon_patlatici_cesitleri/oyun_balon_patlatici_cesitleri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('5 çeşit, kimlikler benzersiz, 33 dil', () {
    expect(balonCesitConfigs.length, 5);
    expect(balonCesitConfigs.map((c) => c.gameId).toSet().length, 5);
    for (final c in balonCesitConfigs) {
      expect(c.title.length, 33);
    }
  });

  for (final rules in balonCesitRules) {
    test('${rules.gameId}: bölümler üretilir ve bot tarafından geçilir', () {
      final planner = LevelPlanner(gameId: rules.gameId, optionalMechanics: rules.optionalMechanics);
      for (final lv in [1, 54321]) {
        expect(rules.build(planner.spec(lv)).validation.ok, isTrue, reason: '${rules.gameId} $lv');
      }
    });
  }
}
