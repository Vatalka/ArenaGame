abstract class LevelUpEvent {}

class IncreasesStatEvent extends LevelUpEvent {
  final String statName;

  IncreasesStatEvent(this.statName);
}

class DecreaseStatEvent extends LevelUpEvent {
  final String statName;

  DecreaseStatEvent(this.statName);
}

class ConfirmUpgradeEvent extends LevelUpEvent {}
