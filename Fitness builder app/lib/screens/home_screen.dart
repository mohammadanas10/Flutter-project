import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/fitness_provider.dart';
import '../widgets/fitness_stat_card.dart';
import '../experiments/experiment_01_dart_basics.dart';
import '../experiments/experiment_02_widgets_layout.dart';
import '../experiments/experiment_03_responsive.dart';
import '../experiments/experiment_04_navigation.dart';
import '../experiments/experiment_05_state_management.dart';
import '../experiments/experiment_06_custom_widgets_theme.dart';
import '../experiments/experiment_07_forms.dart';
import '../experiments/experiment_08_animations.dart';
import '../experiments/experiment_09_rest_api.dart';
import '../experiments/experiment_10_testing_debugging.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _experiments = <(String, String, IconData, Widget Function())>[
    ('Experiment 1', 'Dart Language Basics', Icons.code, Experiment01DartBasics.new),
    ('Experiment 2', 'Basic Widgets & Layout', Icons.dashboard_customize, Experiment02WidgetsLayout.new),
    ('Experiment 3', 'Responsive UI & MediaQuery', Icons.devices, Experiment03Responsive.new),
    ('Experiment 4', 'Navigation & Named Routes', Icons.navigation, Experiment04Navigation.new),
    ('Experiment 5', 'State Management / Provider', Icons.sync, Experiment05StateManagement.new),
    ('Experiment 6', 'Custom Widgets & Themes', Icons.widgets, Experiment06CustomWidgetsTheme.new),
    ('Experiment 7', 'Forms & Validation', Icons.assignment, Experiment07Forms.new),
    ('Experiment 8', 'Animations', Icons.animation, Experiment08Animations.new),
    ('Experiment 9', 'REST API & JSON', Icons.cloud_download, Experiment09RestApi.new),
    ('Experiment 10', 'Testing & Debugging', Icons.bug_report, Experiment10TestingDebugging.new),
  ];

  @override
  Widget build(BuildContext context) {
    final fitness = context.watch<FitnessProvider>();
    final progress = (fitness.steps / fitness.dailyGoal).clamp(0.0, 1.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitTrack Lab'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const _SettingsScreen())),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF00796B), Color(0xFF26A69A)]),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('YOUR DAILY MOVEMENT', style: TextStyle(color: Colors.white70, letterSpacing: 1.1)),
                const SizedBox(height: 8),
                Text('${fitness.steps} steps', style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(value: progress, minHeight: 9, backgroundColor: Colors.white30, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text('${(progress * 100).round()}% of ${fitness.dailyGoal} step goal', style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 14),
                Wrap(spacing: 8, children: [
                  FilledButton.tonalIcon(
                    onPressed: () => context.read<FitnessProvider>().addSteps(500),
                    icon: const Icon(Icons.add),
                    label: const Text('+500 steps'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.read<FitnessProvider>().resetSteps(),
                    icon: const Icon(Icons.restart_alt, color: Colors.white),
                    label: const Text('Reset', style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white70)),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Today at a glance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
            children: const [
              FitnessStatCard(title: 'Calories', value: '245', unit: 'kcal', icon: Icons.local_fire_department, color: Colors.deepOrange),
              FitnessStatCard(title: 'Distance', value: '3.2', unit: 'km', icon: Icons.route, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 22),
          const Text('Flutter Lab — 10 Experiments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Open each experiment to explore the lab-manual concept in the fitness tracker.'),
          const SizedBox(height: 10),
          ..._experiments.map((item) => Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(item.$3)),
              title: Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(item.$2),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => item.$4())),
            ),
          )),
          const SizedBox(height: 16),
          const Text('Note: steps and calories shown here are demo values, not sensor measurements.',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

class _SettingsScreen extends StatelessWidget {
  const _SettingsScreen();

  @override
  Widget build(BuildContext context) {
    final fitness = context.watch<FitnessProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark mode'),
            subtitle: const Text('Uses Provider shared state'),
            value: fitness.darkMode,
            onChanged: context.read<FitnessProvider>().toggleDarkMode,
          ),
          SwitchListTile(
            title: const Text('Workout reminders'),
            value: fitness.remindersEnabled,
            onChanged: context.read<FitnessProvider>().toggleReminders,
          ),
          ListTile(
            title: const Text('Daily step goal'),
            subtitle: Text('${fitness.dailyGoal} steps'),
            trailing: DropdownButton<int>(
              value: fitness.dailyGoal,
              items: const [5000, 8000, 10000, 12000].map((v) => DropdownMenuItem(value: v, child: Text('$v'))).toList(),
              onChanged: (v) { if (v != null) context.read<FitnessProvider>().updateGoal(v); },
            ),
          ),
        ],
      ),
    );
  }
}
