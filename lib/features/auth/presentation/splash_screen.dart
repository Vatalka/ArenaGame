import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Це тепер якийсь Лоадінг Скрін :)
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
