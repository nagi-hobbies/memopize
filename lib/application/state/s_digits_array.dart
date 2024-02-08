import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_digits_array.g.dart';

/// [SDigitsArrayNotifier]は、数字の配列の状態を管理するためのNotifierです。
@riverpod
class SDigitsArrayNotifier extends _$SDigitsArrayNotifier {
  @override
  List<String> build() {
    // return List<String>.empty(growable: true);
    return [
      "0123456789",
      "0123456789",
      "0123456789",
    ];
  }

  /// [add]メソッドは、指定された数字を配列に追加します。
  ///
  /// [digit] 追加する数字
  void add(String digit) {
    state.add(digit);
  }
}
