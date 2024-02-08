import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:memopize/presentation/widgets/digit.dart';
import 'package:memopize/presentation/widgets/digits_row.dart';

class ConstsListView extends HookWidget {
  const ConstsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final counts = useState(30);
    final text = Text('Count: ${counts.value}');
    final nowIndex = useState(0);
    final nowIndexText = Text('Now Index: ${nowIndex.value}');
    final listView = ListView.builder(
        itemCount: counts.value,
        itemBuilder: (BuildContext context, int index) {
          Future.delayed(const Duration(milliseconds: 0), () {
            nowIndex.value = index;
          });
          if (index.isOdd) {
            return const Divider();
          }
          if (index + 10 >= counts.value) {
            // ビルド数ループ分遅らせる
            Future.delayed(const Duration(milliseconds: 1), () {
              counts.value += 10;
            });
          }
          return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Center(
                  child: DigitsRow(
                      digits: "0123456789", openInd: index ~/ 2 % 11)));
        });
    return Column(
      children: [
        text,
        nowIndexText,
        SizedBox(height: 400, child: listView),
      ],
    );
  }
}
