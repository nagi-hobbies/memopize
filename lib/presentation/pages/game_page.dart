import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/consts_listview_h.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';

import '../widgets/rnd_button.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key, required this.constId});
  final String constId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWaitingInput = ref.watch(sIsWaitingInputNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    final highscore =
        ref.watch(sGameSessionNotifierProvider).displayConstData.highscore;
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
                      Text('High Score: $highscore')
                    ],
                  ),
                  const SizedBox(
                      width: 500, height: 250, child: ConstsListView()),
                  const SizedBox(
                      width: 300, height: 400, child: StrictButtonPanel()),
                  ElevatedButton(
                      onPressed: !isWaitingInput
                          ? () {
                              ref.read(pressedContinueUseCaseProvider).call();
                            }
                          : null,
                      child: const Text('Continue')),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        final router = ref.read(goRouterProvider);
                        router.goNamed(
                          PageId.collection.routeName,
                        );
                      },
                      child: const Text('Collection Page')),
                ])));
  }
}
