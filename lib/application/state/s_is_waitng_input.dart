import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_is_waitng_input.g.dart';

@riverpod
class SIsWaitingInputNotifier extends _$SIsWaitingInputNotifier {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}
