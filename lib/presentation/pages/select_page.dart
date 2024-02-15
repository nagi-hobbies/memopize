import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/domain/types/constants.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/select_const_roll.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class SelectPage extends HookConsumerWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currConstInd = useState(-1);
    const double itemEtent = 100;
    const int itemNum = 1000;

    const int jumpIndex = 10;

    debugPrint('itemNum: ${itemNum / 2 * itemEtent}');
    final scrollController = ScrollController(
      initialScrollOffset: itemNum / 2 * itemEtent,
    );
    scrollController.addListener(() {
      debugPrint('offset: ${scrollController.offset}');
      if (scrollController.offset < jumpIndex * itemEtent) {
        scrollController.jumpTo(itemNum / 2 * itemEtent);
      }
      if (scrollController.offset > (itemNum - jumpIndex) * itemEtent) {
        scrollController.jumpTo(itemNum ~/ 2 * itemEtent);
      }
      currConstInd.value =
          (scrollController.offset + itemEtent / 2) ~/ itemEtent;
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                          child: currConstInd.value == -1
                              ? const Text('Select a constant.')
                              : TexText(
                                  tex: Constants
                                      .values[currConstInd.value %
                                          Constants.values.length]
                                      .tex)))),
              SizedBox(
                height: 100,
                child: SelectConstRoll(
                  itemEtent: itemEtent,
                  itemNum: itemNum,
                  scrollController: scrollController,
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final usecase = ref.read(startGameSessionUseCaseProvider(
                        Constants
                            .values[
                                currConstInd.value % Constants.values.length]
                            .name));
                    await usecase.call();
                    final router = ref.read(goRouterProvider);
                    router.goNamed(
                      PageId.game.routeName,
                      pathParameters: {
                        'constName': Constants
                            .values[
                                currConstInd.value % Constants.values.length]
                            .name
                      },
                    );
                  },
                  child: const Text('Start')),
              //   Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: Constants.values.map(
              //       (constant) {
              //         return ElevatedButton(
              //           onPressed: () async {
              //             final usecase = ref.read(
              //                 startGameSessionUseCaseProvider(constant.name));
              //             await usecase.call();
              //             final router = ref.read(goRouterProvider);
              //             router.goNamed(
              //               PageId.game.routeName,
              //               pathParameters: {'constName': constant.name},
              //             );
              //           },
              //           child: SizedBox(
              //               height: 100, child: TexText(tex: constant.tex)),
              //         );
              //       },
              //     ).toList(),
              //   ),
            ],
          ),
        ));
  }
}
