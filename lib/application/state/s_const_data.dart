import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_const_data.g.dart';

/// [SConstDataNotifier]は、数字の配列の状態を管理するためのNotifierです。
@Riverpod(keepAlive: true)
class SConstDataNotifier extends _$SConstDataNotifier {
  @override
  String build() {
    // return List<String>.empty(growable: true);
    return '';
  }

  /// [add]メソッドは、指定された数字を配列に追加します。
  ///
  /// [digit] 追加する数字
  void add(String digit) {
    state += digit;
    // debugPrint('value: $state, digit: $digit at SConstDataNotifier.add()');
  }

  void clear() {
    state = '';
  }

  String get value => state;
}
