```dart
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitness Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Good Morning! 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Track your daily fitness activity',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // Steps
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    const Icon(
                      Icons.directions_walk,
                      size: 55,
                      color: Colors.green,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Today\'s Steps',
                      style: TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      '6,245',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      'Goal: 10,000 steps',
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 15),

                    LinearProgressIndicator(
                      value: 0.6245,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Calories and Distance
            Row(
              children: [

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                            size: 35,
                          ),
                          SizedBox(height: 8),
                          Text('Calories'),
                          SizedBox(height: 5),
                          Text(
                            '420 kcal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.route,
                            color: Colors.blue,
                            size: 35,
                          ),
                          SizedBox(height: 8),
                          Text('Distance'),
                          SizedBox(height: 5),
                          Text(
                            '4.2 km',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Today\'s Activity',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.directions_walk),
                ),
                title: const Text('Morning Walk'),
                subtitle: const Text('30 minutes'),
                trailing: const Text('180 kcal'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.directions_bike),
                ),
                title: const Text('Cycling'),
                subtitle: const Text('20 minutes'),
                trailing: const Text('140 kcal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
