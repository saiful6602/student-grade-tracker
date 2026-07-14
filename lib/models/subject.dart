/// Represents a single subject with a name and a mark.
///
/// The mark is stored in a private field (`_mark`) and exposed through
/// a public getter/setter so external code cannot bypass validation logic
/// if it is added later.
class Subject {
  final String name;
  double _mark;

  Subject({
    required this.name,
    required double mark,
  }) : _mark = mark;

  /// Public read access to the private mark field.
  double get mark => _mark;

  /// Public write access to the private mark field.
  set mark(double value) => _mark = value;

  /// Derives a letter grade from the mark:
  /// A >= 80, B >= 65, C >= 50, otherwise F.
  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }
}
