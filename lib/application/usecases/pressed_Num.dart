import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/features/digit_judgementor.dart';

class PressedNumUseCase {
  PressedNumUseCase({
    required this.openDigitsNumNotifier,
    required this.constValueNotifier,
    required this.isWaitingInputNotifier,
    required this.playSettingsNotifier,
    required this.scoreNotifier,
  });

  final SOpenDigitsNumNotifier openDigitsNumNotifier;
  final SConstValueNotifier constValueNotifier;
  final SIsWaitingInputNotifier isWaitingInputNotifier;
  final SPlaySettingsNotifier playSettingsNotifier;
  final SScoreNotifier scoreNotifier;

  Future<void> pressedNum(int pressedNum) async {
    final judgementor = DigitJudgementor();
    final bool result = judgementor.judge(pressedNum.toString(),
        openDigitsNumNotifier.value, constValueNotifier.value);

    if (result) {
      openDigitsNumNotifier.increment();
      if (scoreNotifier.value < openDigitsNumNotifier.value) {
        scoreNotifier.set(openDigitsNumNotifier.value);
      }
    } else {
      isWaitingInputNotifier.toggle();
      openDigitsNumNotifier.set(constValueNotifier.value.length);

      //
      // final rowLength = playSettingsNotifier.value.rowLength;
      // final incNum = rowLength - openDigitsNumNotifier.value % rowLength;
      // debugPrint('incNum: $incNum');
      // for (int i = 0; i < incNum; i++) {
      //   await Future.delayed(Duration(milliseconds: 100), () {
      //     openDigitsNumNotifier.increment();
      //     debugPrint('delay');
      //   });
      // }
    }
  }
}
