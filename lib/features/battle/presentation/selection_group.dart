import 'package:arena_game/features/battle/domain/battle_state.dart';
import 'package:flutter/material.dart';

class SelectionGroup extends StatelessWidget {
  final String title;
  final Area? currentSelection;
  final Function(Area) onSelected;

  const SelectionGroup({
    super.key,
    required this.title,
    this.currentSelection,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Area.values.map((area) {
            final isSelected = currentSelection == area;
            return ChoiceChip(
              label: Text(area.name),
              selected: isSelected,
              onSelected: (_) => onSelected(area),
            );
          }).toList(),
        ),
      ],
    );
  }
}
