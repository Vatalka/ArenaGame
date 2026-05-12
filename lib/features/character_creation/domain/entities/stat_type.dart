enum StatType {
  vitality(label: 'Vitality', description: '1 VIT = 5 HP'),
  strength(label: 'Strength', description: '1 STR = 2 DMG');

  final String label;
  final String description;

  const StatType({required this.label, required this.description});
}
