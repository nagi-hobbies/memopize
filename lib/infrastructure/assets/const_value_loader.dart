import 'package:flutter/services.dart';

/// [ConstValueLoader]はassetsから定数を読み込む
class ConstValueLoader {
  Future<String> loadConstValueFromAsset(String constName) async {
    final Future<String> constValue = rootBundle
        .loadString('assets/texts/const_data/$constName.txt')
        .then((value) => value.replaceAll('\r\n', ''));
    return constValue;
  }

  Future<String> getInitValue(String constName) {
    return loadConstValueFromAsset(constName);
  }
}
