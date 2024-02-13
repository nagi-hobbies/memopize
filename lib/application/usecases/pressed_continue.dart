import 'package:flutter/foundation.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';

class PressedContinueUseCase {
  PressedContinueUseCase({
    required this.sScoreNotifier,
    required this.sIsWaitingInputNotifier,
    required this.sOpenDigitsNumNotifier,
  });

  final SScoreNotifier sScoreNotifier;
  final SIsWaitingInputNotifier sIsWaitingInputNotifier;
  final SOpenDigitsNumNotifier sOpenDigitsNumNotifier;
  void call() {
    final incNum = sScoreNotifier.value - sOpenDigitsNumNotifier.value;
    debugPrint('incNum: $incNum');
    sOpenDigitsNumNotifier.set(sScoreNotifier.value);
    sIsWaitingInputNotifier.toggle();
  }
}
