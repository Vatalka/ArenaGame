import 'dart:async';
import 'package:arena_game/core/widgets/game_tooltip.dart';
import 'package:arena_game/core/widgets/stroke_text.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/widgets/experience_bar.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterCard extends ConsumerStatefulWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  ConsumerState<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends ConsumerState<CharacterCard> {
  Timer? _uiTicker;

  @override
  void initState() {
    super.initState();
    _startUiTicker();
  }

  @override
  void didUpdateWidget(covariant CharacterCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _startUiTicker();
  }

  void _startUiTicker() {
    _uiTicker?.cancel();

    if (widget.character.currentHp >= widget.character.maxHp ||
        widget.character.isInCombat) {
      return;
    }

    _uiTicker = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (mounted) {
        if (widget.character.liveHp >= widget.character.maxHp) {
          _uiTicker?.cancel();
        }
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _uiTicker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final char = widget.character;

    final double exactHp = char.liveHp;
    final displayHp = exactHp.floor();
    final maxHp = char.maxHp;

    final hpPercent = maxHp > 0 ? exactHp / maxHp : 0.0;
    final xpPercent = char.nextLevelExp > 0
        ? char.experience / char.nextLevelExp
        : 0.0;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            // Level & name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameTooltip(message: 'level', child: Text('[${char.level}] ')),
                Text(
                  char.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),

            // Hit Points
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      HealthBar(hp: hpPercent),
                      Positioned(
                        left: 5,
                        child: StrokeText(
                          text: 'HP',
                          fontSize: 11,
                          textColor: colorScheme.surface,
                          strokeColor: colorScheme.onSurface,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: Text(
                          '$displayHp/$maxHp',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Experience & stats
            GameTooltip(
              message: 'experience: ${char.experience}/${char.nextLevelExp}',
              child: ExperienceBar(xp: xpPercent),
            ),
            GameTooltip(
              message: '1 vitality = 10 HP',
              child: Text('VIT: ${char.vitality}'),
            ),
            GameTooltip(
              message: '1 strength = 2 damage',
              child: Text('STR: ${char.strength}'),
            ),
          ],
        ),
      ),
    );
  }
}
