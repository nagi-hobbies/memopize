import 'dart:math';

import 'package:memopize/application/state/memorize_page/s_is_waitng_input.dart';
import 'package:memopize/application/state/memorize_page/s_open_digits_num.dart';
import 'package:memopize/application/state/memorize_page/s_previous_open_digits_num.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_score.dart';

class PressedContinueUseCase {
  PressedContinueUseCase({
    required this.sScoreNotifier,
    required this.sIsWaitingInputNotifier,
    required this.sOpenDigitsNumNotifier,
    required this.sPreviousOpenDigitsNumNotifier,
    required this.sGameSessionNotifier,
  });

  final SScoreNotifier sScoreNotifier;
  final SIsWaitingInputNotifier sIsWaitingInputNotifier;
  final SOpenDigitsNumNotifier sOpenDigitsNumNotifier;
  final SPreviousOpenDigitsNumNotifier sPreviousOpenDigitsNumNotifier;
  final SGameSessionNotifier sGameSessionNotifier;
  void call() {
    sOpenDigitsNumNotifier.set(max(
        sPreviousOpenDigitsNumNotifier.value -
            sGameSessionNotifier.value.revertCount,
        0));
    sIsWaitingInputNotifier.toggle();
  }
}
