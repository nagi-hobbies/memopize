import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_digits_array.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/domain/features/digits_loader.dart';

class StrictModeUseCase {
  StrictModeUseCase({required this.ref});
  final WidgetRef ref;

  void pressedNumber(int pressedNum) {
    final int openDigitsNum = ref.read(sOpenDigitsNumNotifierProvider);
    final List<String> digitsArray = ref.read(sDigitsArrayNotifierProvider);
    final rowLength = ref.read(sPlaySettingsNotifierProvider).rowLength;
    // debugPrint('pressedNum: $pressedNum');
    // debugPrint('openDigitsNum: $openDigitsNum');
    if (pressedNum.toString() ==
        digitsArray[openDigitsNum ~/ rowLength][openDigitsNum % rowLength]) {
      ref.read(sOpenDigitsNumNotifierProvider.notifier).increment();
    } else {
      for (int i = 0; i < 10; i++) {
        ref.read(sOpenDigitsNumNotifierProvider.notifier).decrement();
      }
    }
  }

  Future<void> loadNextDigits() async {
    await DigitsLoader().loadNextDigits().then((value) {
      final digitsArrayNotifier =
          ref.read(sDigitsArrayNotifierProvider.notifier);
      digitsArrayNotifier.add(value);
    });
  }

  Future<void> loadInitialDigits() async {
    // while (ref.read(sDigitsArrayNotifierProvider).length < 50) {
    //   await DigitsLoader().loadNextDigits().then((value) {
    //     final digitsArrayNotifier =
    //         ref.read(sDigitsArrayNotifierProvider.notifier);
    //     digitsArrayNotifier.add(value);
    //   });
    // }
    ref.read(sDigitsArrayNotifierProvider.notifier).add('0123456789');
  }

  void judge(int pressedNum) {}
}
