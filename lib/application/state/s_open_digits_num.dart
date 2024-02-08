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
}
