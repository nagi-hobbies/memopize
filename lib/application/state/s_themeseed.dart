import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 's_themeseed.g.dart';

@riverpod
class SThemeSeedNotifier extends _$SThemeSeedNotifier {
  @override
  Color build() {
    return Colors.blue;
  }

  void update(Color color) {
    state = color;
  }
}
