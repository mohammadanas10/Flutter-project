# Fitness Tracker — Flutter Lab (10 Experiments)

This project uses one Fitness Tracker theme to demonstrate the concepts in the supplied **FLUTTER LAB MANUAL.docx**. Each experiment has a dedicated screen and can be opened from the app's Experiment Lab.

## Experiments included

1. **Dart Language Basics** — variables, lists, conditional logic, loops and functions.
2. **Basic Widgets & Layouts** — `Text`, `Container`, `Card`, `Row`, `Column` and `Stack`.
3. **Responsive UI & MediaQuery** — `LayoutBuilder`, screen dimensions and a width breakpoint.
4. **Navigation** — `Navigator.push`, `Navigator.pop`, and a named route.
5. **State Management** — `StatelessWidget`, `StatefulWidget`, `setState`, Provider, `ChangeNotifier`, `notifyListeners`, `context.watch` and `context.read`.
6. **Custom Widgets & Themes** — reusable fitness stat cards and app-wide `ThemeData`.
7. **Forms & Validation** — name/email input, activity goal, checkbox, and `Form` validation.
8. **Animations** — explicit `AnimationController`/`ScaleTransition` and implicit `AnimatedContainer`.
9. **REST API** — async/await, HTTP GET, JSON parsing, `FutureBuilder`, and `ListView.builder`.
10. **Testing & Debugging** — widget test plus `debugPrint` guidance and DevTools steps.

## Run the project

1. Install Flutter and an Android emulator, or connect an Android phone with USB debugging enabled.
2. Extract the ZIP and open the `Flutter_Fitness_Tracker_10_Experiments` folder in VS Code.
3. In a terminal opened in that folder, generate the platform folders, fetch packages, and run:

```bash
flutter create .
flutter pub get
flutter run
```

Run the automated test:

```bash
flutter test
```

For Experiment 9, the device needs internet access to load the sample JSON endpoint. The API is a demo source; it does not provide real health data.

## File structure

- `lib/main.dart` — app entry point and theme
- `lib/models/fitness_provider.dart` — shared app state
- `lib/screens/home_screen.dart` — home dashboard and experiment list
- `lib/experiments/experiment_01_dart_basics.dart` through `experiment_10_testing_debugging.dart` — experiment screens
- `test/widget_test.dart` — basic widget test

## Notes

- Step counts and fitness goals are sample values, not readings from a phone sensor or smartwatch.
- The code is provided as a lab learning project. Run `flutter pub get`, `flutter analyze`, and `flutter test` in your local Flutter installation to verify it in your environment.
