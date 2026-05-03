import 'package:arena_game/features/battle/domain/battle_state.dart';
import 'package:flutter/material.dart';

class SelectionGroup extends StatelessWidget {
  final String title;
  final Area? currentSelection;
  final Function(Area?) onSelected;

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
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: ChoiceChip(
                label: Text(area.name),
                selected: isSelected,
                onSelected: (bool selected) {
                  onSelected(selected ? area : null);
                },
                elevation: 2,
                showCheckmark: false,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
