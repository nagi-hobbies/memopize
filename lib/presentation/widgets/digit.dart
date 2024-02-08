import 'package:flutter/material.dart';

class Digit extends StatelessWidget {
  final String digit;

  const Digit({super.key, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Text(
      digit != '-1' ? digit.toString() : '?', // -1 は非表示
      style: const TextStyle(fontSize: 20),
    );
  }
}
