import 'package:memopize/application/state/memorize_page/s_is_waitng_input.dart';
import 'package:memopize/application/state/memorize_page/s_open_digits_num.dart';
import 'package:memopize/application/state/memorize_page/s_previous_open_digits_num.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/features/digit_judgementor.dart';

class PressedNumUseCase {
  PressedNumUseCase({
    required this.sOpenDigitsNumNotifier,
    required this.sPreviousOpenDigitsNumNotifier,
    required this.sIsWaitingInputNotifier,
    required this.sGameSessionNotifier,
    required this.scoreNotifier,
  });

  final SOpenDigitsNumNotifier sOpenDigitsNumNotifier;
  final SPreviousOpenDigitsNumNotifier sPreviousOpenDigitsNumNotifier;
  final SIsWaitingInputNotifier sIsWaitingInputNotifier;
  final SGameSessionNotifier sGameSessionNotifier;
  final SScoreNotifier scoreNotifier;

  Future<void> pressedNum(int pressedNum) async {
    final judgementor = DigitJudgementor();
    final bool result = judgementor.judge(pressedNum.toString(),
        sOpenDigitsNumNotifier.value, sGameSessionNotifier.value.constValue);

    if (result) {
      sOpenDigitsNumNotifier.increment();

      if (scoreNotifier.value < sOpenDigitsNumNotifier.value) {
        scoreNotifier.set(sOpenDigitsNumNotifier.value);
      }
    } else {
      sIsWaitingInputNotifier.toggle();
      sPreviousOpenDigitsNumNotifier.set(sOpenDigitsNumNotifier.value);
      sOpenDigitsNumNotifier
          .set(sGameSessionNotifier.value.constValue.length - 1); // . の分を引く
    }
  }
}
