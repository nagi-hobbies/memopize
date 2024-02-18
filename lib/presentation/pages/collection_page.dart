import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class CollectionPage extends HookConsumerWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DisplayConstData> displayConstDataList =
        ref.watch(sDisplayConstDataListNotifierProvider);
    final isExpanded =
        useState(List.filled(displayConstDataList.length, false));
    return Scaffold(
        appBar: AppBar(
          title: const Text('memoPize'),
        ),
        backgroundColor: const Color(0xfff9fafe),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: List.generate(
              displayConstDataList.length,
              (i) => Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                          title: Text(displayConstDataList[i].name),
                          subtitle:
                              Text('${displayConstDataList[i].firstthree}...'),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: TexText(tex: displayConstDataList[i].tex)),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedRotation(
                                    duration: const Duration(milliseconds: 300),
                                    turns: isExpanded.value[i] ? 0.5 : 0,
                                    child: const Icon(Icons.expand_more),
                                  ),
                                  IconButton.filled(
                                    onPressed: () async {
                                      final router = ref.read(goRouterProvider);
                                      final usecase = ref.read(
                                          startGameSessionUseCaseProvider(
                                              displayConstDataList[i].id));
                                      await usecase.call();
                                      router.goNamed(
                                        PageId.memorize.routeName,
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.play_arrow_outlined,
                                    ),
                                  ),
                                ]),
                          ),
                          children: [
                            ListTile(
                              title: Text(displayConstDataList[i].description),
                            ),
                          ],
                          onExpansionChanged: (value) {
                            var newIsExpanded = isExpanded.value.toList();
                            newIsExpanded[i] = value;
                            isExpanded.value = newIsExpanded;
                          }),
                    ),
                  )).toList(),
        ));
  }
}
