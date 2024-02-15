import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memopize/domain/types/constants.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class SelectConstRoll extends StatelessWidget {
  const SelectConstRoll(
      {super.key,
      required this.itemEtent,
      required this.scrollController,
      required this.itemNum});
  final double itemEtent;
  final int itemNum;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      clipBehavior: Clip.antiAlias,
      itemExtent: itemEtent,
      children: List.generate(
        itemNum,
        (index) => Card(
          child: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                  child: TexText(
                      tex: Constants
                          .values[index % Constants.values.length].tex))),
        ),
      ),
    );
  }
}
