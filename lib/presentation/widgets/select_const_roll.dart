import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class SelectConstRoll extends ConsumerWidget {
  const SelectConstRoll({
    super.key,
    required this.itemEtent,
    required this.scrollController,
  });
  final double itemEtent;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayConstDataList =
        ref.watch(sDisplayConstDataListNotifierProvider);
    return ListView(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      clipBehavior: Clip.antiAlias,
      itemExtent: itemEtent,
      children: displayConstDataList.map((displayConstData) {
        return Card(
          elevation: 5,
          child: SizedBox(
              width: itemEtent * 0.9,
              height: itemEtent * 0.9,
              child: Center(
                  child: TexText(
                tex: displayConstData.tex,
              ))),
        );
      }).toList(),
      // List.generate(
      //   itemNum,
      //   (index) => Card(
      //     child: SizedBox(
      //         width: 100,
      //         height: 100,
      //         child: Center(
      //             child: TexText(
      //           tex: displayConstDataList[index % displayConstDataList.length]
      //               .tex,
      //         ))),
      //   ),
      // ),
    );
  }
}
