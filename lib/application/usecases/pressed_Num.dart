import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:memopize/application/state/s_flip_card_controller.dart';
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
    required this.flipCardControllerList,
  });

  final SOpenDigitsNumNotifier openDigitsNumNotifier;
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
      // flipCardControllerList[openDigitsNumNotifier.value - 1].toggleCard();

      if (scoreNotifier.value < openDigitsNumNotifier.value) {
        scoreNotifier.set(openDigitsNumNotifier.value);
      }
    } else {
      isWaitingInputNotifier.toggle();
      openDigitsNumNotifier
          .set(sGameSessionNotifier.value.constValue.split('.')[1].length);
      // flipCardControllerList.forEach((controller) {
      //   if (controller.state == CardSide.FRONT) {
      //     controller.toggleCard();
      //   }
      // });
    }
  }
}
