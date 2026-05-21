import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:arena_game/features/character/presentation/controller/selection_controller.dart';
import 'package:arena_game/features/character/presentation/widgets/character_stat_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionScreen extends ConsumerWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(selectionControllerProvider);
    final activeCharacter = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('SelectionScreen')),
      body: charactersAsync.when(
        data: (characters) {
          if (characters.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Modular.to.navigate('/creation');
            });
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              var char = characters[index];
              if (char.id == activeCharacter.id) {
                char = activeCharacter;
              }
              return ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                title: CharacterStatCard(character: char),
                trailing: IconButton(
                  onPressed: () async {
                    try {
                      await ref
                          .read(selectionControllerProvider.notifier)
                          .removeCharacter();
                    } catch (e) {
                      if (kDebugMode) {
                        print('Unable to delete character: $e');
                      }
                    }
                  },
                  icon: Icon(Icons.delete),
                ),
                onTap: () {
                  Modular.to.navigate('/game');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
