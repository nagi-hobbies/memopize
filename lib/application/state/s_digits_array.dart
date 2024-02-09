import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_digits_array.g.dart';

/// [SDigitsArrayNotifier]は、数字の配列の状態を管理するためのNotifierです。
@riverpod
class SDigitsArrayNotifier extends _$SDigitsArrayNotifier {
  @override
  List<String> build() {
    // return List<String>.empty(growable: true);
    return [
      "1415926535",
      "8979323846",
      "2643383279",
      "5028841971",
      "6939937510",
      "5820974944",
      "5923078164",
      "0628620899",
      "8628034825",
      "3421170679",
    ];
  }

  /// [add]メソッドは、指定された数字を配列に追加します。
  ///
  /// [digit] 追加する数字
  void add(String digit) {
    state.add(digit);
  }
}
