import 'package:flutter/material.dart';
import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_is_pressed_continue.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/features/digit_judgementor.dart';

class PressedNumUseCase {
  PressedNumUseCase({
    required this.openDigitsNumNotifier,
    required this.constDataNotifier,
    required this.isWaitingInputNotifier,
    required this.playSettingsNotifier,
    required this.scoreNotifier,
  });

  final SOpenDigitsNumNotifier openDigitsNumNotifier;
  final SConstDataNotifier constDataNotifier;
  final SIsWaitingInputNotifier isWaitingInputNotifier;
  final SPlaySettingsNotifier playSettingsNotifier;
  final SScoreNotifier scoreNotifier;

  Future<void> pressedNum(int pressedNum) async {
    final judgementor = DigitJudgementor();
    final bool result = judgementor.judge(pressedNum.toString(),
        openDigitsNumNotifier.value, constDataNotifier.value);

    if (result) {
      openDigitsNumNotifier.increment();
      scoreNotifier.set(openDigitsNumNotifier.value);
    } else {
      isWaitingInputNotifier.toggle();
      openDigitsNumNotifier.set(constDataNotifier.value.length);

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
