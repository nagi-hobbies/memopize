import 'package:flutter/services.dart';

class ConstDataLoader {
  Future<String> loadConstDataFromAsset(String constName) async {
    final Future<String> constData = rootBundle
        .loadString('texts/const_data/$constName.txt')
        .then((value) => value.replaceAll('\r\n', ''));
    return constData;
  }

  Future<String> getInitData(String constName) {
    return loadConstDataFromAsset(constName);
  }
}
