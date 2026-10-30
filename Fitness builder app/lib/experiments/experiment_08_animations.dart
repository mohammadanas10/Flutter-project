import 'package:flutter/material.dart';

class Experiment08Animations extends StatefulWidget {
  const Experiment08Animations({super.key});

  @override
  State<Experiment08Animations> createState() => _Experiment08AnimationsState();
}

class _Experiment08AnimationsState extends State<Experiment08Animations> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  bool expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat(reverse: true);
    _scale = Tween<double>(begin: 0.75, end: 1.15).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 8: Animations')),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Explicit animation: AnimationController + Tween'),
          const SizedBox(height: 28),
          ScaleTransition(scale: _scale, child: const Icon(Icons.favorite, size: 72, color: Colors.red)),
          const SizedBox(height: 48),
          const Text('Implicit animation: AnimatedContainer'),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: expanded ? 220 : 140,
              height: expanded ? 100 : 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: expanded ? Colors.teal : Colors.orange, borderRadius: BorderRadius.circular(expanded ? 24 : 8)),
              child: Text(expanded ? 'Tap to shrink' : 'Tap to expand', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ]),
      )),
    );
  }
}
