import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/domain/types/game_session.dart';

class Digit extends ConsumerWidget {
  /// 一つの数字を表示する
  const Digit({super.key, required this.digit, required this.creared});
  final String digit;
  final bool creared;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameSession playSettings = ref.watch(sGameSessionNotifierProvider);
    return Text(
      digit != '-1' ? digit.toString() : '?', // -1 は非表示
      style: GoogleFonts.sono(
        fontSize: playSettings.digitFontSize,
        color: creared ? Colors.green : Colors.red,
      ),
    );
  }
}
