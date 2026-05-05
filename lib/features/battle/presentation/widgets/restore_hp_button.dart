import 'package:arena_game/features/battle/domain/usecases/restore_all_hp_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestoreHpButton extends ConsumerWidget {
  const RestoreHpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          minimumSize: Size(0, 0),
          shape: const CircleBorder(),
        ),
        onPressed: () => ref.read(restoreAllHpUseCaseProvider).execute(),
        child: Icon(
          Icons.refresh,
          size: 24,
        ),
      ),
    );
  }
}
