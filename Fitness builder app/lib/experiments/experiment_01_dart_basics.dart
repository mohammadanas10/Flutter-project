import 'package:flutter/material.dart';

class Experiment01DartBasics extends StatelessWidget {
  const Experiment01DartBasics({super.key});

  int totalCalories(List<int> values) {
    var total = 0;
    for (final value in values) {
      total += value;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    const String user = 'Fitness Learner';
    const int year = 2026;
    const List<int> sessions = [120, 180, 95];
    final calories = totalCalories(sessions);
    final goalReached = calories >= 350;

    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 1: Dart Basics')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('Variables, data types, lists, loops, conditions and functions',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _result('String variable', user),
        _result('Integer variable', '$year'),
        _result('Workout calorie list', '$sessions'),
        _result('Total from function', '$calories kcal'),
        _result('if condition', goalReached ? 'Goal achieved' : 'Keep moving'),
        const SizedBox(height: 12),
        const Text('Loop output:'),
        ...sessions.map((v) => ListTile(leading: const Icon(Icons.fitness_center), title: Text('Workout burned $v kcal'))),
      ]),
    );
  }

  Widget _result(String title, String value) => Card(
    child: ListTile(title: Text(title), subtitle: Text(value)),
  );
}
