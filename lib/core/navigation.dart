import 'package:flutter/material.dart';

class CounterNavigationDestination {
  final IconData icon;
  final String label;
  const CounterNavigationDestination(this.icon, this.label);
}

final List<CounterNavigationDestination> counterNavigationDestinations = [
  CounterNavigationDestination(Icons.home, 'Home'),
  CounterNavigationDestination(Icons.add, 'Add'),
  CounterNavigationDestination(Icons.settings, 'Settings'),
];

class CounterNavigationBar extends StatelessWidget {
  const CounterNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        destinations: counterNavigationDestinations
            .map((e) =>
                NavigationDestination(icon: Icon(e.icon), label: e.label))
            .toList());
  }
}

class CounterNavigationRail extends StatelessWidget {
  const CounterNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: counterNavigationDestinations
          .map((e) => NavigationRailDestination(
              icon: Icon(e.icon), label: Text(e.label)))
          .toList(),
      selectedIndex: 0,
    );
  }
}
