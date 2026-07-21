import 'package:arena_game/core/theme/game_colors.dart';
import 'package:flutter/material.dart';

Widget buildWithTheme({required Widget child}) {
  return MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      extensions: [
        GameColors(
          healthHigh: Colors.green,
          healthMedium: Colors.yellow,
          healthLow: Colors.red,
          logAttack: Colors.orangeAccent,
          logDamage: Colors.redAccent,
          logBlock: Colors.brown,
          logInfo: Colors.blueGrey,
        ),
      ],
    ),
    home: Scaffold(body: child),
  );
}
