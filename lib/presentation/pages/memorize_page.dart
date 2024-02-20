import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/memorize_page/list_key.dart';
import 'package:memopize/application/state/memorize_page/s_global_object_key_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/domain/types/game_session.dart';
import 'package:memopize/presentation/widgets/digit_card.dart';
import 'package:memopize/presentation/widgets/digit_cards_row.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class MemorizePage extends HookConsumerWidget {
  const MemorizePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKey = ref.watch(listKeyProvider);
    const itemExtent = 60.0;
    final openDigitsNum = ref.watch(sOpenDigitsNumNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    final GameSession gameSession = ref.watch(sGameSessionNotifierProvider);
    final constValueBelow = gameSession.constValue.split('.')[1];

    final controllerList = useState(
        List.generate(constValueBelow.length, (index) => FlipCardController()));

    final globalObjectKeyList = ref.watch(
        globalObjectKeyListProvider(length: gameSession.constValue.length));

    final scrollController = ScrollController();

    scrollController.addListener(() {
      debugPrint('scrollController');
      // if (scrollController.position.pixels ==
      //     scrollController.position.maxScrollExtent) {
      //   debugPrint('scrollController.position.maxScrollExtent');
      //   globalKeyAnimatedList.currentState!.insertItem(1);
      // }
    });

    Color chooseColor(int digitInd) {
      if (score < digitInd) {
        return Colors.red;
      } else if (score == digitInd) {
        return Colors.orange;
      } else {
        return Colors.green;
      }
    }

    scrollController.addListener(() {
      debugPrint('scrollController');
    });

    useEffect(() {
      for (int i = 0; i < constValueBelow.length; i++) {
        if (globalObjectKeyList[i].currentState == null) {
          continue;
        }
        // else if (globalObjectKeyList[i].controller == null) {
        //   continue;
        // }
        final wheatherOpen = i < openDigitsNum;
        final isOpend = !globalObjectKeyList[i].currentState!.isFront;
        debugPrint(
            'toggleCard $i, wheatherOpen: $wheatherOpen, isOpend: $isOpend');
        if (wheatherOpen != isOpend) {
          globalObjectKeyList[i].currentState!.toggleCard();
        }
        // if (controllerList.value[i].state == null) {
        //   continue;
        // } else if (controllerList.value[i].controller == null) {
        //   continue;
        // }

        // final wheatherOpen = i < openDigitsNum;
        // final isOpend = !controllerList.value[i].state!.isFront;
        // debugPrint('wheatherOpen: $wheatherOpen, isOpend: $isOpend');
        // if (wheatherOpen != isOpend) {
        //   debugPrint('toggleCard $i');
        //   controllerList.value[i].toggleCard();

        //   debugPrint('${controllerList.value[i].state!.isFront}');
        // }
      }
      return () {};
    }, [openDigitsNum]);

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('Game'),
              TextButton(onPressed: () {}, child: Text('1')),
            ],
          ),
        ),
        backgroundColor: const Color(0xfff9fafe),
        body: Column(
          children: [
            SizedBox(
                height: 100,
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
                          width: 80,
                          height: 80,
                          child:
                              TexText(tex: gameSession.displayConstData.tex)),
                      Text(
                        'Score: ${score}',
                      ),
                      Text(
                        'highScore: ${gameSession.displayConstData.highscore}',
                      ),
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
              child: AnimatedList(
                  key: listKey,
                  controller: scrollController,
                  initialItemCount: 5,
                  itemBuilder: (context, colId, animation) {
                    if (colId == 0) {
                      return DigitCardsRow(
                          animation: animation,
                          key: GlobalObjectKey('firstRow'),
                          children: [
                            DigitCard(
                              id: -1,
                              controller: FlipCardController(),
                              digitText: gameSession.constValue.substring(0, 2),
                              color: Colors.green,
                              initSide: CardSide.BACK,
                            ),
                            ...List.generate(
                              gameSession.rowLength,
                              (rowId) => DigitCard(
                                id: rowId,
                                controller: controllerList.value[rowId],
                                digitText: constValueBelow[rowId],
                                color: chooseColor(rowId),
                              ),
                            )
                          ]);
                    } else {
                      return DigitCardsRow(
                          animation: animation,
                          key: GlobalObjectKey('row$colId'),
                          children: [
                            DigitCard(
                              isDammy: true,
                              id: -1,
                              controller: FlipCardController(),
                              digitText: 'digitText',
                              color: Colors.black,
                              initSide: CardSide.BACK,
                            ),
                            ...List.generate(
                                gameSession.rowLength,
                                (rowId) => DigitCard(
                                      key: GlobalObjectKey('row$colId$rowId'),
                                      id: (colId) * gameSession.rowLength +
                                          rowId,
                                      controller: controllerList.value[
                                          (colId) * gameSession.rowLength +
                                              rowId],
                                      digitText: constValueBelow[
                                          (colId) * gameSession.rowLength +
                                              rowId],
                                      color: chooseColor(
                                          (colId) * gameSession.rowLength +
                                              rowId),
                                    )),
                          ]);
                    }
                  }),
              // child: ListView.builder(
              //     itemExtent: itemExtent,
              //     controller: scrollController,
              //     itemBuilder: (context, colId) {
              //       if (colId == 0) {
              //         return DigitCardsRow(
              //             key: GlobalObjectKey('firstRow'),
              //             children: [
              //               DigitCard(
              //                 id: -1,
              //                 controller: FlipCardController(),
              //                 digitText: gameSession.constValue.substring(0, 2),
              //                 color: Colors.green,
              //                 initSide: CardSide.BACK,
              //               ),
              //               ...List.generate(
              //                 gameSession.rowLength,
              //                 (rowId) => DigitCard(
              //                   id: rowId,
              //                   controller: controllerList.value[rowId],
              //                   digitText: constValueBelow[rowId],
              //                   color: chooseColor(
              //                       (colId) * gameSession.rowLength + rowId),
              //                 ),
              //               )
              //             ]);
              //       } else {
              //         return DigitCardsRow(
              //             key: GlobalObjectKey('row$colId'),
              //             children: [
              //               DigitCard(
              //                 id: -1,
              //                 isDammy: true,
              //                 // key: cardKeyList[index],
              //                 controller: FlipCardController(),
              //                 digitText: 'digitText',
              //                 color: Colors.black,
              //                 initSide: CardSide.BACK,
              //               ),
              //               ...List.generate(
              //                   gameSession.rowLength,
              //                   (rowId) => DigitCard(
              //                         id: (colId) * gameSession.rowLength +
              //                             rowId,
              //                         // key: cardKeyList[
              //                         //     (colId + 1) * gameSession.rowLength +
              //                         //         rowId],
              //                         // controller: controllerList.value.value[
              //                         //     (colId + 1) * gameSession.rowLength +
              //                         //         rowId],
              //                         // key: cardKeyList[
              //                         //     (index) * gameSession.rowLength +
              //                         //         rowId],
              //                         controller: controllerList.value[
              //                             (colId) * gameSession.rowLength +
              //                                 rowId],
              //                         digitText: constValueBelow[
              //                             (colId) * gameSession.rowLength +
              //                                 rowId],
              //                         color: chooseColor(
              //                             (colId) * gameSession.rowLength +
              //                                 rowId),
              //                       )),
              //             ]);
              //       }
              //     }),

//p

              //   child: ListView(children: [
              //     DigitCardsRow(children: [
              //       DigitCard(
              //         controller: FlipCardController(),
              //         digitText: gameSession.constValue.substring(0, 2),
              //         color: Colors.green,
              //         initSide: CardSide.BACK,
              //       ),
              //       ...List.generate(
              //         gameSession.rowLength,
              //         (rowId) => DigitCard(
              //           // key: cardKeyList[rowId],
              //           controller:
              //               ref.watch(flipCardControllerListProvider)[rowId],
              //           digitText: constValueBelow[rowId],
              //           color: score < rowId ? Colors.red : Colors.green,
              //         ),
              //       )
              //     ]),
              //     ...List.generate(
              //         constValueBelow.length ~/ gameSession.rowLength - 1,
              //         (colId) => DigitCardsRow(children: [
              //               DigitCard(
              //                 isDammy: true,
              //                 controller: FlipCardController(),
              //                 digitText: 'digitText',
              //                 color: Colors.black,
              //                 initSide: CardSide.BACK,
              //               ),
              //               ...List.generate(
              //                   gameSession.rowLength,
              //                   (rowId) => DigitCard(
              //                         // key: cardKeyList[
              //                         //     (colId + 1) * gameSession.rowLength +
              //                         //         rowId],
              //                         // controller: controllerList.value[
              //                         //     (colId + 1) * gameSession.rowLength +
              //                         //         rowId],
              //                         controller: ref.watch(
              //                                 flipCardControllerListProvider)[
              //                             (colId + 1) * gameSession.rowLength +
              //                                 rowId],
              //                         digitText: constValueBelow[
              //                             (colId + 1) * gameSession.rowLength +
              //                                 rowId],
              //                         color: score <
              //                                 (colId + 1) *
              //                                         gameSession.rowLength +
              //                                     rowId
              //                             ? Colors.red
              //                             : Colors.green,
              //                       )),
              //             ])),
              //   ]),
            ),
            SizedBox(width: 300, height: 400, child: StrictButtonPanel()),
            FlipCard(
                // key: const ValueKey('flipCard'),
                controller: controllerList.value[14],
                front: Text('front'),
                back: Text('back')),
          ],
        ));
  }
}
