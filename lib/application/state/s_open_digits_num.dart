import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_open_digits_num.g.dart';

@riverpod
class SOpenDigitsNumNotifier extends _$SOpenDigitsNumNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state += 1;
  }

  void decrement() {
    if (state == 0) return;
    state -= 1;
  }

  void set(value) {
    state = value;
  }

  int get value => state;
}
