import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/domain/types/play_settings.dart';
import 'package:memopize/presentation/widgets/digit.dart';

class DigitsRow extends ConsumerWidget {
  /// 一行分の数字を表示する
  const DigitsRow({
    super.key,
    required this.digits,
    required this.colInd,
    required this.openDigitsNum,
    required this.score,
  });
  final String digits;
  final int colInd;
  final int openDigitsNum;
  final int score;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlaySettings playSettings = ref.watch(sPlaySettingsNotifierProvider);
    bool getStatus(int index, int number) {
      if (index + playSettings.rowLength * (colInd - 1) < number) {
        return true;
      }
      return false;
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          digits.length,
          (index) => Digit(
              digit: (getStatus(index, openDigitsNum) ? digits[index] : '-1'),
              creared: getStatus(index, score)), // -1 は非表示
        ));
  }
}
