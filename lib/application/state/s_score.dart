import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_score.g.dart';

@riverpod
class SScoreNotifier extends _$SScoreNotifier {
  @override
  int build() {
    return 0;
  }

  void set(value) {
    state = value;
  }

  void reset() {
    state = 0;
  }

  int get value => state;
}
