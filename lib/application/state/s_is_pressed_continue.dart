import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_is_pressed_continue.g.dart';

@riverpod
class SIsPressedContinueNotifier extends _$SIsPressedContinueNotifier {
  @override
  bool build() {
    return false;
  }

  void setTrue() {
    state = true;
  }

  void setFalse() {
    state = false;
  }

  bool get value => state;
}
