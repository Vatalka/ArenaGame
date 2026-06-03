import 'package:arena_game/features/game/battle/domain/entities/battle_selection.dart';
import 'package:flutter/material.dart';

typedef AreaSelectionCallback = void Function(Area? area);

class SelectionGroup extends StatelessWidget {
  final String title;
  final Area? currentSelection;
  final AreaSelectionCallback? onSelected;

  const SelectionGroup({
    super.key,
    required this.title,
    this.currentSelection,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(title),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Area.values.map((area) {
                final isSelected = currentSelection == area;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  child: ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    pressElevation: 2,
                    label: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text(area.name)),
                    ),
                    selected: isSelected,
                    onSelected: onSelected != null
                        ? (bool selected) {
                            onSelected!.call(selected ? area : null);
                          }
                        : null,
                    elevation: 4,
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
