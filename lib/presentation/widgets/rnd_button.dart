import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/state/s_themeseed.dart';

class RndButton extends ConsumerWidget {
  /// ランダムにテーマのシードカラーを変更するボタン
  const RndButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final random = Random();
    const colorList = Colors.primaries;

    changeThemeseed() {
      final color = colorList[random.nextInt(colorList.length)];
      ref.read(sThemeSeedNotifierProvider.notifier).update(color);
    }

    return TextButton(
        onPressed: changeThemeseed, child: const Text('Change Color'));
  }
}
