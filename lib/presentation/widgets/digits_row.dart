import 'package:flutter/material.dart';
import 'package:memopize/presentation/widgets/digit.dart';

class DigitsRow extends StatelessWidget {
  final String digits;
  final int openInd;
  const DigitsRow({super.key, required this.digits, required this.openInd});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          digits.length,
          (index) =>
              Digit(digit: (index < openInd ? digits[index] : '-1')), // -1 は非表示
        ));
  }
}
