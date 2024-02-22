import 'package:flutter/material.dart';
import 'package:flutter_heroes_2024_workshop/notifier/counter_notifier.dart';
import 'package:flutter_heroes_2024_workshop/pages/counter_detail_page.dart';

class CountersPage extends StatelessWidget {
  final CountersNotifier notifier;
  final bool isPage;
  const CountersPage(this.notifier, this.isPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return ListView.builder(
            itemCount: notifier.counters.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                selected: index == notifier.selectedIndex,
                selectedTileColor:
                    Theme.of(context).colorScheme.primaryContainer,
                title: Text('Counter'),
                trailing: Text('${notifier.counters[index]}',
                    style: Theme.of(context).textTheme.headlineMedium),
                onTap: () {
                  if (isPage) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CounterDetailPage(notifier)));
                  }
                  notifier.select(index);
                },
              );
            },
          );
        });
  }
}
