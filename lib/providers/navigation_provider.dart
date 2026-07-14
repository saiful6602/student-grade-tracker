import 'package:flutter/foundation.dart';

/// Manages which tab/screen is currently selected in the
/// BottomNavigationBar. Kept in Provider (instead of setState)
/// so the whole app stays setState-free.
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
