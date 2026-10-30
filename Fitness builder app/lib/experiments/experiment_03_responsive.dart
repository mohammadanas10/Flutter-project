import 'package:flutter/material.dart';

class Experiment03Responsive extends StatelessWidget {
  const Experiment03Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 3: Responsive UI')),
      body: LayoutBuilder(builder: (context, constraints) {
        final wide = constraints.maxWidth > 600;
        final statCards = [
          _responsiveCard(Icons.directions_walk, 'Steps', '4,250'),
          _responsiveCard(Icons.local_fire_department, 'Calories', '245 kcal'),
          _responsiveCard(Icons.route, 'Distance', '3.2 km'),
        ];
        return Padding(
          padding: EdgeInsets.all(wide ? 28 : 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Width: ${size.width.toStringAsFixed(0)} px | ${wide ? 'Tablet/Desktop layout' : 'Mobile layout'}'),
            const SizedBox(height: 16),
            Expanded(child: wide
              ? Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Container(width: 170, padding: const EdgeInsets.all(16), color: Colors.teal.shade100,
                    child: const Text('Sidebar\n\nDashboard\nWorkouts\nGoals', style: TextStyle(height: 2))),
                  const SizedBox(width: 16),
                  Expanded(child: GridView.count(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, children: statCards)),
                ])
              : Column(children: [
                  Expanded(child: statCards[0]),
                  const SizedBox(height: 10),
                  Expanded(child: statCards[1]),
                  const SizedBox(height: 10),
                  Expanded(child: statCards[2]),
                ]),
            ),
          ]),
        );
      }),
    );
  }

  Widget _responsiveCard(IconData icon, String title, String value) => Card(
    child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 32, color: Colors.teal),
      const SizedBox(height: 8),
      Text(title),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    ])),
  );
}
