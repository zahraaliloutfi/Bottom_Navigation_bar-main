import 'package:flutter/material.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: User(),
    );
  }
}
