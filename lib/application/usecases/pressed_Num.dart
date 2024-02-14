import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/features/digit_judgementor.dart';

class PressedNumUseCase {
  PressedNumUseCase({
    required this.openDigitsNumNotifier,
    required this.isWaitingInputNotifier,
    required this.sGameSessionNotifier,
    required this.scoreNotifier,
  });

  final SOpenDigitsNumNotifier openDigitsNumNotifier;
  final SIsWaitingInputNotifier isWaitingInputNotifier;
  final SGameSessionNotifier sGameSessionNotifier;
  final SScoreNotifier scoreNotifier;

  Future<void> pressedNum(int pressedNum) async {
    final judgementor = DigitJudgementor();
    final bool result = judgementor.judge(pressedNum.toString(),
        openDigitsNumNotifier.value, sGameSessionNotifier.value.constValue);

    if (result) {
      openDigitsNumNotifier.increment();
      if (scoreNotifier.value < openDigitsNumNotifier.value) {
        scoreNotifier.set(openDigitsNumNotifier.value);
      }
    } else {
      isWaitingInputNotifier.toggle();
      openDigitsNumNotifier.set(sGameSessionNotifier.value.constValue.length);
    }
  }
}
