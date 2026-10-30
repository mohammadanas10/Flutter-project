import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/fitness_provider.dart';

class Experiment05StateManagement extends StatefulWidget {
  const Experiment05StateManagement({super.key});

  @override
  State<Experiment05StateManagement> createState() => _Experiment05StateManagementState();
}

class _Experiment05StateManagementState extends State<Experiment05StateManagement> {
  int localWaterGlasses = 0;

  @override
  Widget build(BuildContext context) {
    final fitness = context.watch<FitnessProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 5: State Management')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('Local state: StatefulWidget + setState()', style: TextStyle(fontWeight: FontWeight.bold)),
        Card(child: ListTile(
          leading: const Icon(Icons.water_drop, color: Colors.blue),
          title: Text('Water glasses: $localWaterGlasses'),
          subtitle: const Text('This value belongs only to this screen.'),
          trailing: IconButton(icon: const Icon(Icons.add), onPressed: () => setState(() => localWaterGlasses++)),
        )),
        const SizedBox(height: 18),
        const Text('Shared state: Provider + ChangeNotifier', style: TextStyle(fontWeight: FontWeight.bold)),
        Card(child: ListTile(
          leading: const Icon(Icons.directions_walk, color: Colors.teal),
          title: Text('Shared steps: ${fitness.steps}'),
          subtitle: Text('Daily goal: ${fitness.dailyGoal}. This state is also used on Home.'),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.read<FitnessProvider>().addSteps(250),
          ),
        )),
        const Text('context.watch() listens for updates. context.read() calls methods. notifyListeners() refreshes listening widgets.'),
      ]),
    );
  }
}
