import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/collection_page/const_item.dart';

class ConstListView extends ConsumerWidget {
  const ConstListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayConstDataList =
        ref.watch(sDisplayConstDataListNotifierProvider);

    return ListView(
        padding: const EdgeInsets.all(10),
        children: displayConstDataList.map((displayConstData) {
          return Container(
              margin: const EdgeInsets.all(5),
              child: ConstItem(
                  displayConstData: displayConstData,
                  onPressedCallBack: () async {
                    if (displayConstData.name == 'Coming soon') {
                      return;
                    }
                    final router = ref.read(goRouterProvider);
                    final usecase = ref.read(
                        startGameSessionUseCaseProvider(displayConstData.id));
                    await usecase.call();
                    router.pushNamed(
                      PageId.memorize.routeName,
                    );
                  }));
        }).toList());
  }
}
