import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/application/state/s_is_pressed_continue.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/consts_listview.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';

import '../widgets/rnd_button.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key, required this.constName});
  final String constName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWaitingInput = ref.watch(sIsWaitingInputNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Template App'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Container(
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RndButton(),
                      Text('Score: ${score}'),
                    ],
                  ),
                  SizedBox(width: 500, height: 250, child: ConstsListView()),
                  StrictButtonPanel(),
                  if (!isWaitingInput)
                    ElevatedButton(
                        onPressed: () {
                          ref
                              .read(pressedContinueUseCaseNotifierProvider)
                              .call();
                        },
                        child: const Text('Continue')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       ref.read(sConstDataNotifierProvider.notifier).clear();
                  //       final router = ref.read(goRouterProvider);
                  //       router.goNamed(
                  //         PageId.select.routeName,
                  //       );
                  //     },
                  //     child: const Text('Select Page')),
                ])));
  }
}
