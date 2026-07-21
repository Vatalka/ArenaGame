import 'package:arena_game/core/widgets/game_progress_bar.dart';
import 'package:arena_game/features/character/presentation/widgets/experience_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_theme.dart';

void main() {
  group('ExperienceBar — відображення', () {
    testWidgets('рендериться без помилок', (tester) async {
      await tester.pumpWidget(
        buildWithTheme(child: const ExperienceBar(xp: 0.5)),
      );

      expect(find.byType(ExperienceBar), findsOneWidget);
    });

    testWidgets('містить GameProgressBar', (tester) async {
      await tester.pumpWidget(
        buildWithTheme(child: const ExperienceBar(xp: 0.5)),
      );

      expect(find.byType(GameProgressBar), findsOneWidget);
    });

    testWidgets('передає правильне значення xp у GameProgressBar', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildWithTheme(child: const ExperienceBar(xp: 0.75)),
      );

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );
      expect(progressBar.value, 0.75);
    });

    testWidgets('нульовий xp (0.0) рендериться без помилок', (tester) async {
      await tester.pumpWidget(
        buildWithTheme(child: const ExperienceBar(xp: 0.0)),
      );

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );
      expect(progressBar.value, 0.0);
    });

    testWidgets('повний xp (1.0) рендериться без помилок', (tester) async {
      await tester.pumpWidget(
        buildWithTheme(child: const ExperienceBar(xp: 1.0)),
      );

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );
      expect(progressBar.value, 1.0);
    });
  });

  group('ExperienceBar — колір', () {
    testWidgets('колір xp завжди logAttack незалежно від значення', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildWithTheme(child: const ExperienceBar(xp: 0.1)),
      );

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );

      final colorAtLow = progressBar.fillColorBuilder(0.1);
      final colorAtHigh = progressBar.fillColorBuilder(1.0);

      expect(colorAtLow, colorAtHigh); // колір не змінюється
      expect(colorAtLow, Colors.orangeAccent); // відповідає logAttack
    });
  });
}
