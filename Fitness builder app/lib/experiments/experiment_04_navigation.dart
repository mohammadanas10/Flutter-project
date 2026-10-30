import 'package:flutter/material.dart';

class Experiment04Navigation extends StatelessWidget {
  const Experiment04Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 4: Navigation')),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.navigation, size: 60, color: Colors.teal),
          const SizedBox(height: 12),
          const Text('Navigator.push / Navigator.pop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _WorkoutDetailScreen())),
            child: const Text('Open workout detail (push)'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/home'),
            child: const Text('Go to home using named route'),
          ),
          const SizedBox(height: 12),
          const Text('Use the app bar back button or the detail screen button to pop a route.'),
        ]),
      )),
    );
  }
}

class _WorkoutDetailScreen extends StatelessWidget {
  const _WorkoutDetailScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Workout Detail')),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Icon(Icons.directions_run, size: 64, color: Colors.teal),
      const Text('Morning Walk — 25 minutes'),
      const SizedBox(height: 12),
      FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Back (pop)')),
    ])),
  );
}
