import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class ConstsGridView extends ConsumerWidget {
  const ConstsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayConstDataList =
        ref.watch(sDisplayConstDataListNotifierProvider);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: displayConstDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: TexText(tex: displayConstDataList[index].tex),
        );
      },
    );
  }
}
