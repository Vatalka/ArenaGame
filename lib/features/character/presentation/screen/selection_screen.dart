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
          final isLimitReached = characters.length >= 3;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    var char = characters[index];
                    return ListTile(
                      title: CharacterStatCard(character: char),
                      trailing: IconButton(
                        onPressed: () async {
                          try {
                            await ref
                                .read(selectionControllerProvider.notifier)
                                .removeCharacter(char.id);
                          } catch (e) {
                            if (kDebugMode) {
                              print('Unable to delete character: $e');
                            }
                          }
                        },
                        icon: Icon(Icons.delete),
                      ),
                      onTap: () {
                        ref.read(playerProvider.notifier).selectCharacter(char);
                        Modular.to.navigate('/game');
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  // height: 50,
                  child: ElevatedButton(
                    onPressed: isLimitReached
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Maximum number of Characters 3',
                                ),
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.error,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        : () {
                            Modular.to.navigate('/creation');
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLimitReached ? Colors.grey : null,
                    ),
                    child: const Text(
                      'Create new Character',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
