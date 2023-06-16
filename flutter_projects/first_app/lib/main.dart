import 'package:first_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "go there",
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0)),
      home: home(),
    );
  }
}
