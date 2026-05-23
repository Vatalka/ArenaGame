import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:arena_game/features/character/presentation/controller/selection_controller.dart';
import 'package:arena_game/features/character/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionScreen extends ConsumerWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(selectionControllerProvider);
    final controller = ref.read(selectionControllerProvider.notifier);
    final player = ref.read(playerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('SelectionScreen')),
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
                      horizontalTitleGap: 0.0,
                      contentPadding: const EdgeInsets.only(left: 16),
                      title: CharacterCard(character: char),
                      trailing: IconButton(
                        // iconSize: 30,
                        // padding: EdgeInsets.zero,
                        // constraints: const BoxConstraints(),
                        // style: IconButton.styleFrom(
                        //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // ),
                        onPressed: () async {
                          await controller.removeCharacter(char.id);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.errorContainer,
                          size: 30,
                        ),
                        tooltip: 'delete',
                      ),
                      onTap: () {
                        player.selectCharacter(char);
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
                                  'Maximum number of characters 3',
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
                      'Create new character',
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
    );
  }
}
