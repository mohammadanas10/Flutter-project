import 'package:flutter/material.dart';

class FitnessStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const FitnessStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    this.color = Colors.teal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            Text(unit, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 6),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
