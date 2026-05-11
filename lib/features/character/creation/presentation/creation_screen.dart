import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/stat_selector_row.dart';
import 'package:arena_game/features/character/creation/domain/entities/stat_type.dart';
import 'package:arena_game/features/character/creation/presentation/controller/creation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreationScreen extends ConsumerWidget {
  const CreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(creationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Creation Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      onChanged: (value) =>
                          ref.read(creationProvider.notifier).updateName(value),
                      decoration: InputDecoration(
                        labelText: 'Enter character name',
                        filled: true,
                        fillColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerLowest,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorText: state.nameError,
                      ),
                      maxLength: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: 'Remaining points:  ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        children: [
                          TextSpan(
                            text: '${state.remainingPoints}',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: state.remainingPoints == 0
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.onSecondaryContainer
                                  : Theme.of(
                                      context,
                                    ).extension<GameColors>()!.healthHigh,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: StatType.values.map((type) {
                return StatSelectorRow(
                  type: type,
                  value: ref.watch(
                    creationProvider.select((s) => s.getValueFor(type)),
                  ),
                  onIncrement: state.remainingPoints > 0
                      ? () => ref
                            .read(creationProvider.notifier)
                            .incrementStat(type)
                      : null,
                  onDecrement:
                      ref.read(creationProvider.notifier).canDecrement(type)
                      ? () => ref
                            .read(creationProvider.notifier)
                            .decrementStat(type)
                      : null,
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: state.isValid
                  ? () => Modular.to.navigate('game')
                  : null,
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
