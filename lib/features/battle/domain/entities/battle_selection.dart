import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_selection.freezed.dart';

part 'battle_selection.g.dart';

enum Area { head, body, legs }

@freezed
abstract class BattleSelection with _$BattleSelection {
  const factory BattleSelection({
    Area? selectedAttack,
    Area? selectedBlock,
    @Default(false) bool isBotMode,
  }) = _BattleSelection;

  const BattleSelection._();

  bool get isTurnReady => selectedAttack != null && selectedBlock != null;

  factory BattleSelection.fromJson(Map<String, dynamic> json) =>
      _$BattleSelectionFromJson(json);
}
