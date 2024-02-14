import 'dart:math';

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
    sOpenDigitsNumNotifier.set(max(sScoreNotifier.value - 10, 0));
    sIsWaitingInputNotifier.toggle();
  }
}
