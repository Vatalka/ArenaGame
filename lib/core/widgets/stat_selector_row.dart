import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/character/creation/domain/entities/stat_type.dart';
import 'package:flutter/material.dart';

class StatSelectorRow extends StatelessWidget {
  final StatType type;
  final int value;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const StatSelectorRow({
    super.key,
    required this.type,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Tooltip(
            message: type.description,
            child: Text(
              type.label.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove_circle_outline),
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add_circle_outline),
            color: Theme.of(context).extension<GameColors>()!.healthHigh,
          ),
        ],
      ),
    );
  }
}
