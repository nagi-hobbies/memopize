import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/types/const_data.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/consts_listview.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';

import '../widgets/rnd_button.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key, required this.constPath});
  final String constPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWaitingInput = ref.watch(sIsWaitingInputNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    final Future<ConstData> highscore =
        ConstValueDBHelper.getConstData(constPath);
    return Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const RndButton(),
                      Text('Score: $score'),
                      FutureBuilder(
                          future: highscore,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Row(
                                  children: [
                                    Text('High Score: '),
                                    SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                        )),
                                  ],
                                );
                              case ConnectionState.done:
                                return Text(
                                    'High Score: ${snapshot.data!.highscore}');
                              default:
                                return const Text('High Score: 0');
                            }
                          }),
                    ],
                  ),
                  const SizedBox(
                      width: 500, height: 250, child: ConstsListView()),
                  const SizedBox(
                      width: 300, height: 400, child: StrictButtonPanel()),
                  ElevatedButton(
                      onPressed: !isWaitingInput
                          ? () {
                              ref
                                  .read(pressedContinueUseCaseNotifierProvider)
                                  .call();
                            }
                          : null,
                      child: const Text('Continue')),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(sConstValueNotifierProvider.notifier).clear();
                        final router = ref.read(goRouterProvider);
                        router.goNamed(
                          PageId.select.routeName,
                        );
                      },
                      child: const Text('Select Page')),
                ])));
  }
}
