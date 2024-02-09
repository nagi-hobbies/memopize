import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/s_digits_array.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/usecases/strictmode.dart';
import 'package:memopize/domain/types/play_settings.dart';
import 'package:memopize/presentation/widgets/digits_row.dart';

import '../../application/state/s_play_settings.dart';

class ConstsListView extends HookConsumerWidget {
  /// 数字を表示するリストビュー
  const ConstsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openDigitsNum = ref.watch(sOpenDigitsNumNotifierProvider);
    final PlaySettings playSettings = ref.watch(sPlaySettingsNotifierProvider);

    final digisArray = ref.watch(sDigitsArrayNotifierProvider);
    final listView = ListView.separated(
        itemCount: digisArray.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          // if (index.isOdd) {
          //   return const Divider();
          // }
          return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Center(
                  child: DigitsRow(
                      digits: digisArray[index],
                      rowInd: index,
                      openDigitsNum: openDigitsNum)));
        });
    return Column(
      children: [
        Text('length: ${digisArray.length}'),
        SizedBox(height: 200, child: listView),
        TextButton(
            onPressed: () => {
                  ref.read(sOpenDigitsNumNotifierProvider.notifier).increment(),
                  debugPrint(openDigitsNum.toString())
                },
            child: const Text('Increment'))
      ],
    );
  }
}
