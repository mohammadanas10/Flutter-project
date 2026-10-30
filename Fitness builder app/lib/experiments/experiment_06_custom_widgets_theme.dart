import 'package:flutter/material.dart';
import '../widgets/fitness_stat_card.dart';

class Experiment06CustomWidgetsTheme extends StatelessWidget {
  const Experiment06CustomWidgetsTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 6: Widgets & Themes')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text('Reusable custom FitnessStatCard widgets', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        const FitnessStatCard(title: 'Steps', value: '4,250', unit: 'steps', icon: Icons.directions_walk),
        const SizedBox(height: 10),
        const FitnessStatCard(title: 'Calories', value: '245', unit: 'kcal', icon: Icons.local_fire_department, color: Colors.deepOrange),
        const SizedBox(height: 10),
        const FitnessStatCard(title: 'Distance', value: '3.2', unit: 'km', icon: Icons.route, color: Colors.blue),
        const SizedBox(height: 18),
        Text('ThemeData provides consistent colors and typography.', style: theme.textTheme.bodyLarge),
        const SizedBox(height: 8),
        Text('This text uses Theme.of(context).textTheme.bodyLarge.', style: theme.textTheme.bodyLarge),
      ]),
    );
  }
}
