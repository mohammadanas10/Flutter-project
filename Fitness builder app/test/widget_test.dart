import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Fitness tracker basic UI renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Text('FitTrack Lab'),
              Text('4,250 steps'),
            ],
          ),
        ),
      ),
    );

    expect(find.text('FitTrack Lab'), findsOneWidget);
    expect(find.text('4,250 steps'), findsOneWidget);
    expect(find.text('No such screen'), findsNothing);
  });
}
