import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_is_waitng_input.g.dart';

/// [SIsWaitingInputNotifier]は、入力待ちかどうかを保持する
///
/// 入力を間違えたとき入力を受け付けなくする
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
