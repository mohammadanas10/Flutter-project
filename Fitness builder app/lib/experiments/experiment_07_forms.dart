import 'package:flutter/material.dart';

class Experiment07Forms extends StatefulWidget {
  const Experiment07Forms({super.key});

  @override
  State<Experiment07Forms> createState() => _Experiment07FormsState();
}

class _Experiment07FormsState extends State<Experiment07Forms> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool accepted = false;
  double goal = 8000;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 7: Forms')),
      body: Form(
        key: _formKey,
        child: ListView(padding: const EdgeInsets.all(16), children: [
          const Text('Set up your fitness profile', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Full name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
            validator: (value) => value == null || value.trim().isEmpty ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
            validator: (value) {
              if (value == null || !value.contains('@') || !value.contains('.')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 18),
          Text('Daily step goal: ${goal.round()} steps'),
          Slider(value: goal, min: 3000, max: 15000, divisions: 12, label: goal.round().toString(), onChanged: (v) => setState(() => goal = v)),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: accepted,
            title: const Text('I agree to use demo fitness data'),
            onChanged: (v) => setState(() => accepted = v ?? false),
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () {
              final valid = _formKey.currentState?.validate() ?? false;
              if (!valid || !accepted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fix the errors and accept the checkbox.')));
                return;
              }
              showDialog<void>(context: context, builder: (_) => AlertDialog(
                title: const Text('Profile saved'),
                content: Text('Name: ${_nameController.text}\nEmail: ${_emailController.text}\nGoal: ${goal.round()} steps'),
                actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
              ));
            },
            child: const Text('Validate and save'),
          ),
        ]),
      ),
    );
  }
}
