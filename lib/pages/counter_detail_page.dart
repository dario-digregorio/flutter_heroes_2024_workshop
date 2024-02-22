import 'package:flutter/material.dart';
import 'package:flutter_heroes_2024_workshop/notifier/counter_notifier.dart';

class CounterDetailPage extends StatelessWidget {
  final CountersNotifier notifier;
  const CounterDetailPage(this.notifier, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifier.increment(),
        child: const Icon(Icons.add),
      ),
      body: ListenableBuilder(
          listenable: notifier,
          builder: (context, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${notifier.selectedCounter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
