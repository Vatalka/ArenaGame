import 'package:flutter/material.dart';

class GameTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const GameTooltip({super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      child: child,
    );
  }
}
