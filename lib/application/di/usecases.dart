// usecaseをriverpodによりDIしながら，どこからでも呼び出せるようにする

import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/application/usecases/load_const_data.dart';
import 'package:memopize/application/usecases/pressed_continue.dart';
import 'package:memopize/application/usecases/pressed_num.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memopize/application/usecases/exit_gamepage.dart';

part 'usecases.g.dart';

@riverpod
LoadConstValueUseCase loadConstValueUseCaseNotifier(ref, String constName) {
  return LoadConstValueUseCase(
      sConstValueNotifier: ref.read(sConstValueNotifierProvider.notifier),
      constName: constName);
}

@riverpod
PressedNumUseCase pressedNumUseCaseNotifier(ref) {
  return PressedNumUseCase(
    openDigitsNumNotifier: ref.read(sOpenDigitsNumNotifierProvider.notifier),
    constValueNotifier: ref.read(sConstValueNotifierProvider.notifier),
    isWaitingInputNotifier: ref.read(sIsWaitingInputNotifierProvider.notifier),
    playSettingsNotifier: ref.read(sPlaySettingsNotifierProvider.notifier),
    scoreNotifier: ref.read(sScoreNotifierProvider.notifier),
  );
}

@riverpod
PressedContinueUseCase pressedContinueUseCaseNotifier(ref) {
  return PressedContinueUseCase(
    sScoreNotifier: ref.read(sScoreNotifierProvider.notifier),
    sIsWaitingInputNotifier: ref.read(sIsWaitingInputNotifierProvider.notifier),
    sOpenDigitsNumNotifier: ref.read(sOpenDigitsNumNotifierProvider.notifier),
  );
}

@riverpod
ExitGamePageUseCase exitGamePageUseCaseNotifier(ref) {
  return ExitGamePageUseCase();
}
