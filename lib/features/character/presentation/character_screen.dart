import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/character_provider.dart';

class CharacterScreen extends ConsumerWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final hero = ref.watch(characterProvider);
            return Column(
              children: [
                Text(hero.name),
                Text("HP: ${hero.currentHp}/${hero.maxHp}"),
                Text("STR: ${hero.strength}"),
                Text("VIT: ${hero.vitality}"),
                Text("PRE: ${hero.precision}"),
                Text("AGI: ${hero.agility}"),
                ElevatedButton(
                  onPressed: () {
                    ref.read(characterProvider.notifier).state = hero.copyWith(
                      strength: hero.strength + 1,
                    );
                  },
                  child: Text("Add Strength"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
