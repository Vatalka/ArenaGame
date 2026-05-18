import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
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
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Area.values.map((area) {
                final isSelected = currentSelection == area;
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Center(child: Text(area.name)),
                    ),
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
        ),
      ),
    );
  }
}
