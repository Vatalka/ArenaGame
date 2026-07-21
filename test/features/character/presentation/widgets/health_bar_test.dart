import 'package:arena_game/core/widgets/game_progress_bar.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_theme.dart';

void main() {
  group('HealthBar — відображення', () {
    testWidgets('рендериться без помилок', (tester) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 1.0)));

      expect(find.byType(HealthBar), findsOneWidget);
    });

    testWidgets('містить GameProgressBar', (tester) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 0.5)));

      expect(find.byType(GameProgressBar), findsOneWidget);
    });

    testWidgets('повне HP (1.0) рендериться без помилок', (tester) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 1.0)));

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );
      expect(progressBar.value, 1.0);
    });

    testWidgets('нульове HP (0.0) рендериться без помилок', (tester) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 0.0)));

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );
      expect(progressBar.value, 0.0);
    });
  });

  group('HealthBar — колір залежно від відсотка HP', () {
    testWidgets('при повному HP колір містить зелену складову (healthHigh)', (
      tester,
    ) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 1.0)));

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );

      final color = progressBar.fillColorBuilder(1.0);
      expect(color.g, greaterThan(color.r)); // green > red
      expect(color.b, lessThan(color.g)); // green > blue
    });

    testWidgets('при критичному HP колір червоний (healthLow)', (tester) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 0.1)));

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );

      final color = progressBar.fillColorBuilder(0.1); // <= 0.33 => Colors.red
      expect(color, Colors.red);
    });

    testWidgets('при середньому HP колір між червоним і зеленим', (
      tester,
    ) async {
      await tester.pumpWidget(buildWithTheme(child: const HealthBar(hp: 0.5)));

      final progressBar = tester.widget<GameProgressBar>(
        find.byType(GameProgressBar),
      );

      final color = progressBar.fillColorBuilder(0.5);
      expect(color, isNot(Colors.red));
      expect(color, isNot(Colors.green));
    });
  });
}
