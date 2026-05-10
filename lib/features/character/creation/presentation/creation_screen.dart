import 'package:arena_game/core/widgets/stat_selector_row.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
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
                Text('Remaining\npoints: ${state.remainingPoints}'),
              ],
            ),
            Tooltip(
              message: '1 VIT = 5 hit point',
              child: StatSelectorRow(
                label: 'Vitality',
                value: state.vitality,
                isIncrementEnabled: state.remainingPoints > 0,
                isDecrementEnabled: state.vitality > 3,
                onIncrement: () => ref
                    .read(creationProvider.notifier)
                    .incrementStat('vitality'),
                onDecrement: () => ref
                    .read(creationProvider.notifier)
                    .decrementStat('vitality'),
              ),
            ),
            Tooltip(
              message: '1 STR = 2 damage',
              child: StatSelectorRow(
                label: 'Strength',
                value: state.strength,
                isIncrementEnabled: state.remainingPoints > 0,
                isDecrementEnabled: state.strength > 3,
                onIncrement: () => ref
                    .read(creationProvider.notifier)
                    .incrementStat('strength'),
                onDecrement: () => ref
                    .read(creationProvider.notifier)
                    .decrementStat('strength'),
              ),
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
