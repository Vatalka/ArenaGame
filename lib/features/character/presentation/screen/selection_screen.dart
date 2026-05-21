import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/character/presentation/controller/active_character_notifier.dart';
import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:arena_game/features/character/presentation/widgets/character_stat_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionScreen extends ConsumerWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(allCharactersProvider);
    // final activeChar = ref.watch(playerProvider);
    // if (char.id == activeChar.id) => char = activeChar;
    return Scaffold(
      appBar: AppBar(title: const Text('SelectionScreen')),
      body: charactersAsync.when(
        data: (characters) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(3, (index) {
                final char = characters.length > index
                    ? characters[index]
                    : null;
                if (char != null) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: CharacterStatCard(character: char),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(
                            context,
                          ).extension<GameColors>()!.healthLow,
                        ),
                        onPressed: () async {
                          try {
                            await ref
                                .read(allCharactersProvider.notifier)
                                .deleteCharacter(index);
                          } catch (e) {
                            if (kDebugMode) print('Unable to delete: $e');
                          }
                        },
                      ),
                      onTap: () {
                        ref.read(activeCharacterProvider.notifier).select(char);
                        Modular.to.navigate('/game');
                      },
                    ),
                  );
                } else {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.add_circle_outline, size: 40),
                      title: Text('Slot ${index + 1}'),
                      subtitle: const Text('Click to create a character'),
                      onTap: () {
                        Modular.to.navigate('/creation', arguments: index);
                      },
                    ),
                  );
                }
              }),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
