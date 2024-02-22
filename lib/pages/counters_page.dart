import 'package:flutter/material.dart';
import 'package:flutter_heroes_2024_workshop/notifier/counter_notifier.dart';

class CountersPage extends StatelessWidget {
  final CountersNotifier notifier;
  const CountersPage(this.notifier, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return ListView.builder(
            itemCount: notifier.counters.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Counter'),
              );
            },
          );
        });
  }
}
