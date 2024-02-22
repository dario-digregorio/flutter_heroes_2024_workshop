import 'package:flutter/material.dart';

class CountersPage extends StatelessWidget {
  const CountersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Counter'),
        );
      },
    );
  }
}
