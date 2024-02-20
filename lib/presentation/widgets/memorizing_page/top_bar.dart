import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/presentation/widgets/common/card_element.dart';
import 'package:memopize/presentation/widgets/tex_text.dart';

class TopBar extends StatelessWidget {
  const TopBar(
      {super.key, required this.displayConstData, required this.score});
  final DisplayConstData displayConstData;
  final int score;

  @override
  Widget build(BuildContext context) {
    final h = 100.h;
    return SizedBox(
      height: h,
      child: CardElement(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
                width: h, height: h, child: TexText(tex: displayConstData.tex)),
            Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayConstData.name,
                  ),
                  Text(displayConstData.description),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: displayConstData.highscore > 0
                    ? [
                        Text('High Score: ${displayConstData.highscore}'),
                        Text('Score: $score'),
                      ]
                    : [const Icon(Icons.star), Text('New High Score!: $score')],
              )
            ])
          ],
        ),
      ),
    );
  }
}
