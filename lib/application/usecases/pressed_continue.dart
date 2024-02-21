import 'dart:math';

import 'package:memopize/application/state/memorize_page/s_is_waitng_input.dart';
import 'package:memopize/application/state/memorize_page/s_open_digits_num.dart';
import 'package:memopize/application/state/memorize_page/s_previous_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';

class PressedContinueUseCase {
  PressedContinueUseCase({
    required this.sScoreNotifier,
    required this.sIsWaitingInputNotifier,
    required this.sOpenDigitsNumNotifier,
    required this.sPreviousOpenDigitsNumNotifier,
  });

  final SScoreNotifier sScoreNotifier;
  final SIsWaitingInputNotifier sIsWaitingInputNotifier;
  final SOpenDigitsNumNotifier sOpenDigitsNumNotifier;
  final SPreviousOpenDigitsNumNotifier sPreviousOpenDigitsNumNotifier;
  void call() {
    sOpenDigitsNumNotifier
        .set(max(sPreviousOpenDigitsNumNotifier.value - 10, 0));
    sIsWaitingInputNotifier.toggle();
  }
}
