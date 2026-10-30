import 'package:flutter/material.dart';

class Experiment02WidgetsLayout extends StatelessWidget {
  const Experiment02WidgetsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 2: Widgets & Layout')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(16)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('FITNESS SUMMARY', style: TextStyle(fontSize: 12, letterSpacing: 1.2)),
            SizedBox(height: 8),
            Text('Move more. Feel better.', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            Text('Container + Text + Column'),
          ]),
        ),
        const SizedBox(height: 18),
        const Text('Row layout', style: TextStyle(fontWeight: FontWeight.bold)),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(Icons.directions_walk, size: 34, color: Colors.teal),
          Icon(Icons.favorite, size: 34, color: Colors.red),
          Icon(Icons.local_fire_department, size: 34, color: Colors.deepOrange),
        ]),
        const SizedBox(height: 18),
        const Text('Stack layout', style: TextStyle(fontWeight: FontWeight.bold)),
        Center(child: SizedBox(width: 180, height: 140, child: Stack(alignment: Alignment.center, children: [
          DecoratedBox(decoration: BoxDecoration(color: Colors.teal.shade100, borderRadius: BorderRadius.circular(20)),
            child: const SizedBox(width: 160, height: 120)),
          const Icon(Icons.directions_run, size: 54, color: Colors.teal),
          const Positioned(bottom: 8, child: Text('ACTIVE', style: TextStyle(fontWeight: FontWeight.bold))),
        ]))),
        const SizedBox(height: 14),
        const Card(child: ListTile(leading: Icon(Icons.timer), title: Text('Workout duration'), subtitle: Text('25 minutes — Card + ListTile'))),
      ]),
    );
  }
}
