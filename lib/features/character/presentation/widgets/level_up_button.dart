import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/widgets/stat_selector_row.dart';
import 'package:flutter/material.dart';

class LevelUpButton extends StatelessWidget {
  final Character character;
  final VoidCallback? onSave;

  const LevelUpButton({super.key, required this.character, this.onSave});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return IconButton(
      icon: Icon(
        Icons.add_circle_outline_rounded,
        color: colorScheme.onSurface,
        size: 18,
      ),
      constraints: const BoxConstraints(),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.sizeOf(context).height / 3,
              color: colorScheme.primaryContainer,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Unallocated stat points: ${character.statPoints}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    StatSelectorRow(
                      label: 'Vitality',
                      value: character.vitality,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                    StatSelectorRow(
                      label: 'Strength',
                      value: character.strength,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                    ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
