import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/types/game_session.dart';
import 'package:memopize/presentation/widgets/digits_row.dart';

class ConstsListView extends HookConsumerWidget {
  /// 数字を表示するリストビュー
  const ConstsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openDigitsNum = ref.watch(sOpenDigitsNumNotifierProvider);
    final GameSession gameSession = ref.watch(sGameSessionNotifierProvider);

    final constValue = ref.watch(sGameSessionNotifierProvider).constValue;
    final score = ref.watch(sScoreNotifierProvider);
    final listView = ListView.separated(
        itemCount: constValue.isNotEmpty
            ? constValue.split('.')[1].length ~/ gameSession.rowLength + 1
            : 0,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                alignment: Alignment.center,
                child: Center(
                    child: DigitsRow(
                  digits: constValue.split('.')[0],
                  colInd: 0,
                  openDigitsNum: gameSession.rowLength,
                  score: score,
                )));
          }
          return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Center(
                  child: DigitsRow(
                digits: constValue.split('.')[1].substring(
                    (index - 1) * gameSession.rowLength,
                    index * gameSession.rowLength),
                colInd: index,
                openDigitsNum: openDigitsNum,
                score: score,
              )));
        });
    return Column(
      children: [
        SizedBox(height: 200, child: listView),
        TextButton(
            onPressed: () => {
                  ref.read(sOpenDigitsNumNotifierProvider.notifier).increment(),
                },
            child: const Text('Increment'))
      ],
    );
  }
}
