import 'package:flutter/material.dart';
import 'package:flutter_heroes_2024_workshop/notifier/counter_notifier.dart';

class CounterDetailPage extends StatelessWidget {
  const CounterDetailPage(CountersNotifier notifier, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '0',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
