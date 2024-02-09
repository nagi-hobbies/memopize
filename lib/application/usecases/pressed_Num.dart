import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/domain/features/digit_judgementor.dart';

class PressedNumUseCase {
  PressedNumUseCase({
    required this.openDigitsNumNotifier,
    required this.constDataNotifier,
  });

  final SOpenDigitsNumNotifier openDigitsNumNotifier;
  final SConstDataNotifier constDataNotifier;

  void pressedNum(int pressedNum) {
    final judgementor = DigitJudgementor();
    final bool result = judgementor.judge(pressedNum.toString(),
        openDigitsNumNotifier.value, constDataNotifier.value);
    if (result) {
      openDigitsNumNotifier.increment();
    } else {
      openDigitsNumNotifier.decrement();
    }
  }
}
