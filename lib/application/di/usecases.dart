import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/usecases/load_const_data.dart';
import 'package:memopize/application/usecases/pressed_num.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases.g.dart';

@riverpod
LoadConstDataUseCase loadConstDataUseCase(ref, String constName) {
  return LoadConstDataUseCase(
      sConstDataNotifier: ref.read(sConstDataNotifierProvider.notifier),
      constName: constName);
}

@riverpod
PressedNumUseCase pressedNumUseCase(ref) {
  return PressedNumUseCase(
    openDigitsNumNotifier: ref.read(sOpenDigitsNumNotifierProvider.notifier),
    constDataNotifier: ref.read(sConstDataNotifierProvider.notifier),
  );
}
