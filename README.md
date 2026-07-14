# Student Grade Tracker

A simple Flutter app that lets a student add subjects with marks, see the
letter grade for each subject, and view a live-updating summary.

## What it does

- **Add Subject** — a validated form to enter a subject name and a mark
  (0–100).
- **Subject List** — all subjects in a scrollable list, each showing its
  name, mark, and grade. Swipe an item left to delete it.
- **Summary** — total number of subjects, the average mark, the overall
  grade, and how many subjects are passing. Updates instantly whenever a
  subject is added or removed.
- A theme icon in the AppBar toggles between a custom light theme and a
  custom dark theme.
- Navigation between the three screens uses a `BottomNavigationBar`.

## Grading scale

| Mark      | Grade |
|-----------|-------|
| ≥ 80      | A     |
| ≥ 65      | B     |
| ≥ 50      | C     |
| below 50  | F     |

## Architecture

- `lib/models/subject.dart` — `Subject` class with a private `_mark` field
  and a `grade` getter.
- `lib/providers/subject_provider.dart` — holds the `List<Subject>`, uses
  `.map()` to compute the average mark and `.where()` to filter passing
  subjects.
- `lib/providers/theme_provider.dart` — tracks light/dark mode.
- `lib/providers/navigation_provider.dart` — tracks the selected bottom-nav
  tab (kept in Provider so the app has **zero `setState` calls**).
- `lib/themes/app_themes.dart` — two full custom `ThemeData` objects; every
  widget reads colors via `Theme.of(context)`.
- `lib/screens/` — `AddSubjectScreen`, `SubjectListScreen`, `SummaryScreen`.

All state is managed with the [`provider`](https://pub.dev/packages/provider)
package — there is no `setState` anywhere in the app.

## How to run

1. Make sure the [Flutter SDK](https://docs.flutter.dev/get-started/install)
   is installed and `flutter doctor` reports no blocking issues.
2. Get the dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on a connected device, emulator, or Chrome:
   ```bash
   flutter run
   ```

## Project structure

```
lib/
  main.dart
  models/
    subject.dart
  providers/
    subject_provider.dart
    theme_provider.dart
    navigation_provider.dart
  themes/
    app_themes.dart
  screens/
    add_subject_screen.dart
    subject_list_screen.dart
    summary_screen.dart
```
