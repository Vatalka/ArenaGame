import 'package:arena_game/features/game/battle/presentation/controllers/battle_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattleModeSelector extends ConsumerWidget {
  const BattleModeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _showSearchDialog(context),
          child: const Text('Пошук суперника'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            ref.read(battleProvider.notifier).enableBotMode();
          },
          child: const Text('Битва з Ботом'),
        ),
      ],
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Пошук суперника', textAlign: TextAlign.center),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Очікуємо підключення...'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Відмінити'),
            ),
          ],
        );
      },
    );
  }
}
