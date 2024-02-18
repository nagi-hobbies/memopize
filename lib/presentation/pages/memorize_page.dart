import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/types/game_session.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/digit_card.dart';
import 'package:memopize/presentation/widgets/digit_cards_row.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class MemorizePage extends HookConsumerWidget {
  const MemorizePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openDigitsNum = ref.watch(sOpenDigitsNumNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    final GameSession gameSession = ref.watch(sGameSessionNotifierProvider);
    final constValueBelow = gameSession.constValue.split('.')[1];
    final cardKeyList = List.generate(
        constValueBelow.length, (index) => GlobalKey<FlipCardState>());

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    final route = ref.read(goRouterProvider);
                    route.goNamed(
                      PageId.collection.routeName,
                    );
                  },
                  label:
                      const Text('Back', style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
              const Text('Game'),
            ],
          ),
        ),
        backgroundColor: const Color(0xfff9fafe),
        body: Column(
          children: [
            SizedBox(
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20,
                          child:
                              TexText(tex: gameSession.displayConstData.tex)),
                      Text('Score: ${score}'),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(children: [
                DigitCardsRow(children: [
                  DigitCard(
                    globalKey: GlobalKey<FlipCardState>(), //dammy
                    digitText: gameSession.constValue.substring(0, 2),
                    color: Colors.green.withOpacity(0.5),
                    initSide: CardSide.BACK,
                  ),
                  ...List.generate(
                    gameSession.rowLength,
                    (rowId) => DigitCard(
                      globalKey: cardKeyList[rowId],
                      digitText: constValueBelow[rowId],
                      color: openDigitsNum < gameSession.rowLength
                          ? Colors.red.withOpacity(0.5)
                          : Colors.green.withOpacity(0.5),
                    ),
                  )
                ]),
                ...List.generate(
                    constValueBelow.length ~/ gameSession.rowLength - 1,
                    (colId) => DigitCardsRow(children: [
                          DigitCard(
                            isDammy: true,
                            globalKey: GlobalKey<FlipCardState>(),
                            digitText: 'digitText',
                            color: Colors.black,
                            initSide: CardSide.BACK,
                          ),
                          ...List.generate(
                              gameSession.rowLength,
                              (rowId) => DigitCard(
                                    globalKey: cardKeyList[
                                        (colId + 1) * gameSession.rowLength +
                                            rowId],
                                    digitText: constValueBelow[
                                        (colId + 1) * gameSession.rowLength +
                                            rowId],
                                    color: openDigitsNum < gameSession.rowLength
                                        ? Colors.red.withOpacity(0.5)
                                        : Colors.green.withOpacity(0.5),
                                  )),
                        ])),
              ]),
            ),
          ],
        ));
  }
}
