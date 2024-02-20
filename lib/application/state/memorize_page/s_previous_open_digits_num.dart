import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_previous_open_digits_num.g.dart';

@Riverpod(keepAlive: true)
class SPreviousOpenDigitsNumNotifier extends _$SPreviousOpenDigitsNumNotifier {
  @override
  int build() {
    return 0;
  }

  void set(int value) {
    state = value;
  }

  int get value => state;
}
