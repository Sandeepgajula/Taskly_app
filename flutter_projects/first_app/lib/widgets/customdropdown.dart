import 'package:flutter/material.dart';

class Customdropdownbuttonclass extends StatelessWidget {
  List<String> values;
  late double width;
  Customdropdownbuttonclass(this.values, this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      decoration: BoxDecoration(
        color: Color.fromARGB(215, 240, 237, 235),
        borderRadius: BorderRadius.circular(
          200,
        ),
      ),
      child: DropdownButton(
        underline: Container(),
        value: values.first,
        onChanged: (_) {},
        items: values.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(),
        dropdownColor: Color.fromARGB(126, 248, 247, 247),
      ),
    );
  }
}
