import 'package:flutter/foundation.dart';
import '../models/subject.dart';

/// Holds and manages the list of [Subject]s for the whole app.
/// All screens read from and mutate state through this provider only —
/// there is no setState anywhere in the app.
class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  /// Unmodifiable view of the current subjects.
  List<Subject> get subjects => List.unmodifiable(_subjects);

  /// Example use of `.where()` — subjects that are passing (grade != F).
  List<Subject> get passingSubjects =>
      _subjects.where((subject) => subject.grade != 'F').toList();

  int get totalSubjects => _subjects.length;

  /// Example use of `.map()` — collects all marks to compute the average.
  double get averageMark {
    if (_subjects.isEmpty) return 0;
    final marks = _subjects.map((subject) => subject.mark);
    final total = marks.reduce((a, b) => a + b);
    return total / _subjects.length;
  }

  String get overallGrade {
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  void addSubject(String name, double mark) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  void removeSubject(int index) {
    if (index < 0 || index >= _subjects.length) return;
    _subjects.removeAt(index);
    notifyListeners();
  }
}
