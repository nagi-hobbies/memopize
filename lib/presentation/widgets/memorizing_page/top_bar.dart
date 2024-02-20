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
              SizedBox(
                width: 150.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        displayConstData.name,
                        style: TextStyle(
                            fontSize: 20.w, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(displayConstData.description),
                  ],
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              SizedBox(
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: displayConstData.highscore > 0
                      ? [
                          Text('High Score: ${displayConstData.highscore}',
                              style: TextStyle(fontSize: 15.w)),
                          Text('Score: $score'),
                        ]
                      : [
                          const Icon(Icons.star),
                          Text('New High Score!: $score',
                              style: TextStyle(fontSize: 15.w)),
                        ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
