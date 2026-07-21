import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/battle/presentation/widgets/selection_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildTestWidget({
  required String title,
  Area? currentSelection,
  AreaSelectionCallback? onSelected,
}) {
  return MaterialApp(
    home: Scaffold(
      body: SelectionGroup(
        title: title,
        currentSelection: currentSelection,
        onSelected: onSelected,
      ),
    ),
  );
}

void main() {
  group('SelectionGroup — відображення', () {
    testWidgets('показує заголовок', (tester) async {
      await tester.pumpWidget(buildTestWidget(title: 'Attack'));

      expect(find.text('Attack'), findsOneWidget);
    });

    testWidgets('показує всі три зони (head, body, legs)', (tester) async {
      await tester.pumpWidget(buildTestWidget(title: 'Attack'));

      expect(find.text('head'), findsOneWidget);
      expect(find.text('body'), findsOneWidget);
      expect(find.text('legs'), findsOneWidget);
    });

    testWidgets('відображає три ChoiceChip', (tester) async {
      await tester.pumpWidget(buildTestWidget(title: 'Attack'));

      expect(find.byType(ChoiceChip), findsNWidgets(3));
    });

    testWidgets('обрана зона відображається як selected', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(title: 'Attack', currentSelection: Area.head),
      );

      final chip = tester.widget<ChoiceChip>(
        find.ancestor(of: find.text('head'), matching: find.byType(ChoiceChip)),
      );
      expect(chip.selected, true);
    });

    testWidgets('без currentSelection жоден chip не selected', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(title: 'Attack', currentSelection: null),
      );

      final chips = tester
          .widgetList<ChoiceChip>(find.byType(ChoiceChip))
          .toList();

      expect(chips.every((chip) => !chip.selected), true);
    });
  });

  group('SelectionGroup — взаємодія', () {
    testWidgets('onSelected викликається з правильною зоною при tap', (
      tester,
    ) async {
      Area? selectedArea;

      await tester.pumpWidget(
        buildTestWidget(
          title: 'Attack',
          onSelected: (area) => selectedArea = area,
        ),
      );

      await tester.tap(find.text('body'));
      await tester.pump();

      expect(selectedArea, Area.body);
    });

    testWidgets('повторний tap на вже обрану зону передає null', (
      tester,
    ) async {
      Area? selectedArea = Area.head;

      await tester.pumpWidget(
        buildTestWidget(
          title: 'Attack',
          currentSelection: Area.head,
          onSelected: (area) => selectedArea = area,
        ),
      );

      await tester.tap(find.text('head'));
      await tester.pump();

      expect(selectedArea, isNull);
    });

    testWidgets('onSelected = null робить chips не активним', (tester) async {
      bool wasCalled = false;

      await tester.pumpWidget(
        buildTestWidget(title: 'Attack', onSelected: null),
      );

      await tester.tap(find.text('head'));
      await tester.pump();

      expect(wasCalled, false);
    });
  });
}
