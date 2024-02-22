import 'package:flutter/material.dart';

class CountersNotifier with ChangeNotifier {
  final List<int> _counters = [0];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  int get selectedCounter => _counters[_selectedIndex];
  List<int> get counters => _counters;

  void select(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void increment() {
    _counters[_selectedIndex]++;
    notifyListeners();
  }

  void addCounter() {
    _counters.add(0);
    notifyListeners();
  }
}
