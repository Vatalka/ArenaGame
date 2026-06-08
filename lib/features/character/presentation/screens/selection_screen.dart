import 'package:arena_game/features/battle/presentation/controllers/player_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/character/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionScreen extends ConsumerWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(selectionProvider);
    final controller = ref.read(selectionProvider.notifier);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        Modular.to.navigate('/creation');
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Characters')),
        body: charactersAsync.when(
          data: (characters) {
            final isLimitReached = characters.length >= 3;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      var char = characters[index];
                      return ListTile(
                        horizontalTitleGap: 8.0,
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                        ),
                        title: CharacterCard(character: char),
                        trailing: IconButton(
                          onPressed: () => _showDeleteConfirmation(
                            context,
                            char,
                            controller,
                          ),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.errorContainer,
                            size: 30,
                          ),
                          tooltip: 'delete',
                        ),
                        onTap: () {
                          ref
                              .read(playerProvider.notifier)
                              .selectCharacter(char.id);
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
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLimitReached
                          ? () {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    textAlign: TextAlign.center,
                                    'Character limit 3',
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
                        backgroundColor: isLimitReached
                            ? Theme.of(context).colorScheme.surfaceContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: const Text(
                        'Create new Character',
                        style: TextStyle(
                          fontSize: 18,
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     ref.invalidate(selectionProvider);
        //   },
        //   tooltip: 'Оновити список',
        //   child: const Icon(Icons.refresh),
        // ),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    Character char,
    SelectionNotifier controller,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete Character'),
          content: Text('Are you sure you want to delete ${char.name}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await controller.removeCharacter(char.id);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
