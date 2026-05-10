import 'package:arena_game/core/theme/game_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatSelectorRow extends ConsumerWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool isIncrementEnabled;
  final bool isDecrementEnabled;

  const StatSelectorRow({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    this.isIncrementEnabled = true,
    this.isDecrementEnabled = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          IconButton(
            onPressed: isDecrementEnabled ? onDecrement : null,
            icon: const Icon(Icons.remove_circle_outline),
            color: Theme.of(context).extension<GameColors>()!.healthLow,
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            onPressed: isIncrementEnabled ? onIncrement : null,
            icon: const Icon(Icons.add_circle_outline),
            color: Theme.of(context).extension<GameColors>()!.healthHigh,
          ),
        ],
      ),
    );
  }
}
