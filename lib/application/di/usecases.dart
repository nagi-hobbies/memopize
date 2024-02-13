import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_is_pressed_continue.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/application/usecases/load_const_data.dart';
import 'package:memopize/application/usecases/pressed_continue.dart';
import 'package:memopize/application/usecases/pressed_num.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases.g.dart';

@riverpod
LoadConstDataUseCase loadConstDataUseCaseNotifier(ref, String constName) {
  return LoadConstDataUseCase(
      sConstDataNotifier: ref.read(sConstDataNotifierProvider.notifier),
      constName: constName);
}

@riverpod
PressedNumUseCase pressedNumUseCaseNotifier(ref) {
  return PressedNumUseCase(
    openDigitsNumNotifier: ref.read(sOpenDigitsNumNotifierProvider.notifier),
    constDataNotifier: ref.read(sConstDataNotifierProvider.notifier),
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
