import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
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
              'Weekly Overview',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Steps',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,

                      children: const [
                        DaySteps(day: 'Mon', steps: '6K'),
                        DaySteps(day: 'Tue', steps: '7K'),
                        DaySteps(day: 'Wed', steps: '8K'),
                        DaySteps(day: 'Thu', steps: '5K'),
                        DaySteps(day: 'Fri', steps: '9K'),
                        DaySteps(day: 'Sat', steps: '7K'),
                        DaySteps(day: 'Sun', steps: '6K'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),

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
                            '2,840 kcal',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                      padding: const EdgeInsets.all(18),

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
                            '28.5 km',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.timer),
                ),

                title: const Text('Workout Duration'),

                subtitle: const Text(
                  '5 workouts this week',
                ),

                trailing: const Text(
                  '3h 20m',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.favorite),
                ),

                title: const Text('Average Heart Rate'),

                subtitle: const Text(
                  'During workouts',
                ),

                trailing: const Text(
                  '78 BPM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DaySteps extends StatelessWidget {
  final String day;
  final String steps;

  const DaySteps({
    super.key,
    required this.day,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          day,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(steps),
      ],
    );
  }
}
