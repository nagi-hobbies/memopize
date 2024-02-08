import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_digits_array.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/domain/features/digits_loader.dart';

class StrictModeUseCase {
  StrictModeUseCase({required this.ref});
  final WidgetRef ref;

  void pressedNumber(int pressedNum) {
    final int openDigitsNum = ref.read(sOpenDigitsNumNotifierProvider);
    // debugPrint('pressedNum: $pressedNum');
    // debugPrint('openDigitsNum: $openDigitsNum');
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
