import 'package:arena_game/features/app_startup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsync = ref.watch(initialLocationProvider);
    return locationAsync.when(
      data: (route) {
        Future.microtask(() => Modular.to.navigate(route));
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
      loading: () => const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading world...'),
            ],
          ),
        ),
      ),
      error: (err, stack) =>
          Scaffold(body: Center(child: Text('Initialization error: $err'))),
    );
  }
}
