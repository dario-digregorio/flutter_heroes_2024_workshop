import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_heroes_2024_workshop/core/constants.dart';
import 'package:flutter_heroes_2024_workshop/notifier/counter_notifier.dart';
import 'package:flutter_heroes_2024_workshop/pages/counter_detail_page.dart';
import 'package:flutter_heroes_2024_workshop/pages/counters_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _notifier = CountersNotifier();

  void _incrementCounter() {
    _notifier.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          TextButton.icon(
            label: const Text('Add'),
            onPressed: () => _notifier.addCounter(),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: AppLayout(_notifier),
    );
  }
}

class AppLayout extends StatelessWidget {
  final CountersNotifier _notifier;
  AppLayout(this._notifier, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    return switch ((screenSize, orientation)) {
      (ScreenSize.extraLarge || ScreenSize.large, _) => Row(
          children: [
            Expanded(child: CountersPage(_notifier, false)),
            Expanded(
              child: CounterDetailPage(_notifier),
            ),
          ],
        ),
      (_, Orientation.landscape) => CountersPage(_notifier, true),
      _ => CountersPage(_notifier, true)
    };
  }
}
