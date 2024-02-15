// usecaseをriverpodによりDIしながら，どこからでも呼び出せるようにする

import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/application/usecases/start_game_session.dart';
import 'package:memopize/application/usecases/pressed_continue.dart';
import 'package:memopize/application/usecases/pressed_num.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memopize/application/usecases/exit_gamepage.dart';

part 'usecases.g.dart';

@riverpod
StartGameSessionUseCase startGameSessionUseCase(ref, int constId) {
  return StartGameSessionUseCase(
    sGameSessionNotifier: ref.read(sGameSessionNotifierProvider.notifier),
    sDisplayConstDataListNotifier:
        ref.read(sDisplayConstDataListNotifierProvider.notifier),
    constId: constId,
  );
}

@riverpod
PressedNumUseCase pressedNumUseCase(ref) {
  return PressedNumUseCase(
    openDigitsNumNotifier: ref.read(sOpenDigitsNumNotifierProvider.notifier),
    isWaitingInputNotifier: ref.read(sIsWaitingInputNotifierProvider.notifier),
    sGameSessionNotifier: ref.read(sGameSessionNotifierProvider.notifier),
    scoreNotifier: ref.read(sScoreNotifierProvider.notifier),
  );
}

@riverpod
PressedContinueUseCase pressedContinueUseCase(ref) {
  return PressedContinueUseCase(
    sScoreNotifier: ref.read(sScoreNotifierProvider.notifier),
    sIsWaitingInputNotifier: ref.read(sIsWaitingInputNotifierProvider.notifier),
    sOpenDigitsNumNotifier: ref.read(sOpenDigitsNumNotifierProvider.notifier),
  );
}

@riverpod
ExitGamePageUseCase exitGamePageUseCase(ref) {
  return ExitGamePageUseCase(
    sGameSessionNotifier: ref.read(sGameSessionNotifierProvider.notifier),
    sScoreNotifier: ref.read(sScoreNotifierProvider.notifier),
    sDisplayConstDataListNotifier:
        ref.read(sDisplayConstDataListNotifierProvider.notifier),
  );
}
