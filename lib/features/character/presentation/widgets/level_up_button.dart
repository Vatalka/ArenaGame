import 'package:arena_game/features/character/bloc/level_up_bloc.dart';
import 'package:arena_game/features/character/bloc/level_up_event.dart';
import 'package:arena_game/features/character/bloc/level_up_state.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/usecases/save_character_use_case.dart';
import 'package:arena_game/features/character/presentation/widgets/stat_selector_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelUpButton extends StatelessWidget {
  final Character character;
  final SaveCharacterUseCase saveCharacterUseCase;
  final VoidCallback? onSave;

  const LevelUpButton({
    super.key,
    required this.character,
    required this.saveCharacterUseCase,
    this.onSave,
  });

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
          builder: (sheetContext) {
            return BlocProvider(
              create: (context) => LevelUpBloc(
                initialCharacter: character,
                saveCharacterUseCase: saveCharacterUseCase,
              ),
              child: BlocBuilder<LevelUpBloc, LevelUpState>(
                builder: (blocContext, state) {
                  return Container(
                    height: MediaQuery.sizeOf(context).height / 3,
                    color: colorScheme.primaryContainer,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Unallocated stat points: ${state.availablePoints}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          StatSelectorRow(
                            label: 'Vitality',
                            value:
                                state.character.vitality + state.addedVitality,
                            onIncrement: () => blocContext
                                .read<LevelUpBloc>()
                                .add(IncreaseStatEvent(StatType.vitality)),
                            onDecrement: () => blocContext
                                .read<LevelUpBloc>()
                                .add(DecreaseStatEvent(StatType.vitality)),
                            isIncrementEnabled: state.availablePoints > 0,
                            isDecrementEnabled: state.addedVitality > 0,
                          ),
                          StatSelectorRow(
                            label: 'Strength',
                            value:
                                state.character.strength + state.addedStrength,
                            onIncrement: () => blocContext
                                .read<LevelUpBloc>()
                                .add(IncreaseStatEvent(StatType.strength)),
                            onDecrement: () => blocContext
                                .read<LevelUpBloc>()
                                .add(DecreaseStatEvent(StatType.strength)),
                            isIncrementEnabled: state.availablePoints > 0,
                            isDecrementEnabled: state.addedStrength > 0,
                          ),
                          ElevatedButton(
                            onPressed: state.isSaving
                                ? null
                                : () {
                                    blocContext.read<LevelUpBloc>().add(
                                      ConfirmUpgradeEvent(),
                                    );
                                    onSave?.call();
                                    Navigator.pop(sheetContext);
                                  },
                            child: state.isSaving
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
