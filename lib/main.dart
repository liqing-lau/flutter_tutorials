import 'package:flutter/material.dart';
import 'package:flutter_application/counter/counter_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // What page should the app display when the user starts the app? 
      home: CounterPage(),
    );
  }
}
