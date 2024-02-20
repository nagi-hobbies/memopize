import 'package:flip_card/flip_card_controller.dart';
import 'package:memopize/application/state/memorize_page/s_previous_open_digits_num.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/features/digit_judgementor.dart';

class PressedNumUseCase {
  PressedNumUseCase({
    required this.openDigitsNumNotifier,
    required this.previousOpenDigitsNumNotifier,
    required this.isWaitingInputNotifier,
    required this.sGameSessionNotifier,
    required this.scoreNotifier,
    required this.flipCardControllerList,
  });

  final SOpenDigitsNumNotifier openDigitsNumNotifier;
  final SPreviousOpenDigitsNumNotifier previousOpenDigitsNumNotifier;
  final SIsWaitingInputNotifier isWaitingInputNotifier;
  final SGameSessionNotifier sGameSessionNotifier;
  final SScoreNotifier scoreNotifier;
  final List<FlipCardController> flipCardControllerList;

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
      previousOpenDigitsNumNotifier.set(openDigitsNumNotifier.value);
      openDigitsNumNotifier
          .set(sGameSessionNotifier.value.constValue.length - 1); // . の分を引く
    }
  }
}
