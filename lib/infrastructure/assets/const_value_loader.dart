import 'package:flutter/services.dart';

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
