import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color strokeColor;
  final double strokeWidth;

  const StrokeText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.strokeColor,
    this.strokeWidth = 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ],
    );
  }
}
