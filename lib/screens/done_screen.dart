import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done App'),
      ),
      body: const Text(
        'Done Screen',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
