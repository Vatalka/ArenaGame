import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_selection.freezed.dart';

part 'battle_selection.g.dart';

enum Area { head, body, legs }

@freezed
class BattleSelection with _$BattleSelection {
  const factory BattleSelection({
    Area? selectedAttack,
    Area? selectedBlock,
  }) = _BattleSelection;

  factory BattleSelection.fromJson(Map<String, dynamic> json) =>
      _$BattleSelectionFromJson(json);
}
