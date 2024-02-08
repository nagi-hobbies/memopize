import 'package:flutter/material.dart';
import 'package:memopize/presentation/widgets/digit.dart';

class DigitsRow extends StatelessWidget {
  final String digits;
  final int rowInd;
  final int openDigitsNum;

  /// 一行分の数字を表示する
  const DigitsRow({
    super.key,
    required this.digits,
    required this.rowInd,
    required this.openDigitsNum,
  });
  @override
  Widget build(BuildContext context) {
    bool isOpen(int index) {
      if (index + digits.length * rowInd < openDigitsNum) {
        return true;
      }
      return false;
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          digits.length,
          (index) =>
              Digit(digit: (isOpen(index) ? digits[index] : '-1')), // -1 は非表示
        ));
  }
}
