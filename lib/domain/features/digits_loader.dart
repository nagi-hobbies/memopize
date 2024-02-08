import 'package:riverpod_annotation/riverpod_annotation.dart';

class DigitsLoader {
  Future<String> loadNextDigits() async {
    await Future.delayed(Duration(seconds: 1), () {
      return "0123456789";
    });
    return "-1";
  }
}
