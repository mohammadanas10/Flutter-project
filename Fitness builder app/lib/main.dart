import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/fitness_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FitnessProvider(),
      child: const FitnessTrackerApp(),
    ),
  );
}

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = context.watch<FitnessProvider>().darkMode;
    return MaterialApp(
      title: 'Fitness Tracker Lab',
      debugShowCheckedModeBanner: false,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F8F8),
        cardTheme: const CardThemeData(elevation: 1, margin: EdgeInsets.zero),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
