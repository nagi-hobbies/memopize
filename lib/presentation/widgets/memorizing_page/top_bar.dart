import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/presentation/widgets/common/card_element.dart';
import 'package:memopize/presentation/widgets/common/tex_text.dart';

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
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Row(
            children: [
              SizedBox(
                  width: h,
                  height: h,
                  child: TexText(tex: displayConstData.tex)),
              Expanded(
                child: Row(children: [
                  SizedBox(
                    width: 150.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.h,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            displayConstData.name,
                            style: TextStyle(
                                fontSize: 20.h, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: SingleChildScrollView(
                            child: Text(displayConstData.description),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            displayConstData.highscore >= score
                                ? Text(
                                    'High Score: ${displayConstData.highscore}',
                                    style: TextStyle(fontSize: 15.h))
                                : AnimatedTextKit(
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                        TyperAnimatedText(
                                          'High Score ! ',
                                          textStyle: TextStyle(
                                              fontSize: 15.h,
                                              color: Colors.orange),
                                          speed:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.easeInOutCubic,
                                          textAlign: TextAlign.center,
                                        ),
                                      ]),

                            // : Text('High Score ! ',
                            //     style: TextStyle(
                            //         fontSize: 15.h, color: Colors.orange)),
                            FittedBox(
                              child: Text(
                                'Score: $score',
                                style: TextStyle(fontSize: 40.h),
                              ),
                            )
                          ]),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
