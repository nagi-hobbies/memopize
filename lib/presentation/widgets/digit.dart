import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_play_settings.dart';
import 'package:memopize/domain/types/play_settings.dart';

class Digit extends ConsumerWidget {
  final String digit;

  /// 一つの数字を表示する
  const Digit({super.key, required this.digit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlaySettings playSettings = ref.watch(sPlaySettingsNotifierProvider);
    return Text(
      digit != '-1' ? digit.toString() : '?', // -1 は非表示
      style: TextStyle(
          fontSize: playSettings.digitFontSize, fontFamily: "monospace"),
    );
  }
}
