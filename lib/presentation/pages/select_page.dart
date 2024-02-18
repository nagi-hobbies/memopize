import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/balloon_card.dart';
import 'package:memopize/presentation/widgets/display_constant.dart';
import 'package:memopize/presentation/widgets/select_const_roll.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class SelectPage extends HookConsumerWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayConstDataList =
        ref.watch(sDisplayConstDataListNotifierProvider);
    final gameSession = ref.watch(sGameSessionNotifierProvider);

    final currConstInd = useState(0);
    const double itemEtent = 100;
    const double pad = 20.0;
    final int itemNum = displayConstDataList.length;
    final double listWidth = itemEtent * itemNum;
    final double viewWidth = MediaQuery.of(context).size.width;
    final double offsetMax = listWidth - viewWidth;
    final double para = pad / (viewWidth - 2 * pad);

    int getIndexFromOffset(ScrollPosition position) {
      return (position.pixels +
              viewWidth * position.pixels / offsetMax -
              itemEtent / 2) ~/
          itemEtent;
    }

    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (currConstInd.value != getIndexFromOffset(scrollController.position)) {
        currConstInd.value = getIndexFromOffset(scrollController.position);
        ref.read(sGameSessionNotifierProvider.notifier).set(
              gameSession.copyWith(
                  displayConstData: displayConstDataList[currConstInd.value]),
            );
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Padding(
                      padding: const EdgeInsets.all(pad),
                      child: DisplayConstant(
                          displayConstData: gameSession.displayConstData,
                          tailPos: currConstInd.value / (itemNum - 1)))),
              SizedBox(
                height: 100,
                child: SelectConstRoll(
                  itemEtent: itemEtent,
                  scrollController: scrollController,
                  // scrollController: ScrollController(),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final usecase = ref.read(startGameSessionUseCaseProvider(
                        displayConstDataList[currConstInd.value %
                                displayConstDataList.length]
                            .id));
                    await usecase.call();
                    final router = ref.read(goRouterProvider);
                    router.goNamed(
                      PageId.game.routeName,
                      pathParameters: {
                        'constId': displayConstDataList[currConstInd.value %
                                displayConstDataList.length]
                            .id
                            .toString()
                      },
                    );
                  },
                  child: const Text('Start')),
            ],
          ),
        ));
  }
}
