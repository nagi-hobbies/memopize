import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_const_data.g.dart';

/// [SConstValueNotifier]は、定数の値を保持する
@Riverpod(keepAlive: true)
class SConstValueNotifier extends _$SConstValueNotifier {
  @override
  String build() {
    return '';
  }

  /// [add]メソッドは、指定された数字を配列に追加します。
  ///
  /// [digit] 追加する数字
  void add(String digit) {
    state += digit;
  }

  void clear() {
    state = '';
  }

  String get value => state;
}
