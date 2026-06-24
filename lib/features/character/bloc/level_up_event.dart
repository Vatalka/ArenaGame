enum StatType { strength, vitality }

abstract class LevelUpEvent {}

class IncreaseStatEvent extends LevelUpEvent {
  final StatType statType;

  IncreaseStatEvent(this.statType);
}

class DecreaseStatEvent extends LevelUpEvent {
  final StatType statType;

  DecreaseStatEvent(this.statType);
}

class ConfirmUpgradeEvent extends LevelUpEvent {}
