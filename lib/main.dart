import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV',
      home: HomeScreen(),
    );
  }
}
