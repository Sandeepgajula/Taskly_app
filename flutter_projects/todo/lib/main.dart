import 'package:flutter/material.dart';
import 'package:todo/widgets/Home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter("hivetable");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 236, 65, 65)),
      ),
      home: Home(),
    );
  }
}
