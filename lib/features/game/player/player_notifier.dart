import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier {
  @override
  String build() {
    return '';
  }

  void selectCharacter(String id) {
    state = id;
  }

  void clearSelection() {
    state = '';
  }
}
