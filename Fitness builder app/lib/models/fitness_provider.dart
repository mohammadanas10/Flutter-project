import 'package:flutter/foundation.dart';

class FitnessProvider extends ChangeNotifier {
  int steps = 4250;
  int dailyGoal = 8000;
  bool darkMode = false;
  bool remindersEnabled = true;

  void addSteps(int amount) {
    steps += amount;
    notifyListeners();
  }

  void resetSteps() {
    steps = 0;
    notifyListeners();
  }

  void updateGoal(int value) {
    dailyGoal = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    darkMode = value;
    notifyListeners();
  }

  void toggleReminders(bool value) {
    remindersEnabled = value;
    notifyListeners();
  }
}
