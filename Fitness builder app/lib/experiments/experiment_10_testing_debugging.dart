import 'package:flutter/material.dart';

class Experiment10TestingDebugging extends StatefulWidget {
  const Experiment10TestingDebugging({super.key});

  @override
  State<Experiment10TestingDebugging> createState() => _Experiment10TestingDebuggingState();
}

class _Experiment10TestingDebuggingState extends State<Experiment10TestingDebugging> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 10: Testing & Debugging')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Icon(Icons.bug_report, size: 56, color: Colors.teal),
        const Text('Interactive test target', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Tap count: $count', key: const ValueKey('tapCount')),
        FilledButton(
          onPressed: () {
            setState(() => count++);
            debugPrint('Experiment 10: tap count is now $count');
          },
          child: const Text('Increment counter'),
        ),
        const Divider(height: 32),
        const Text('Debugging procedure', style: TextStyle(fontWeight: FontWeight.bold)),
        const Text('1. Run: flutter run\n2. Check the Debug Console for debugPrint output.\n3. Open Flutter DevTools from VS Code / Android Studio.\n4. Use Flutter Inspector to inspect the widget tree and layout.\n5. Run automated checks with: flutter test'),
        const SizedBox(height: 12),
        const Text('A widget test is included in test/widget_test.dart.', style: TextStyle(color: Colors.teal)),
      ]),
    );
  }
}
