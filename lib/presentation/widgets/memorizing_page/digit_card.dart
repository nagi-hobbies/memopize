import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/memorize_page/s_global_object_key_list.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/application/state/s_open_digits_num.dart';
import 'package:memopize/application/state/s_score.dart';

class DigitCard extends HookConsumerWidget {
  const DigitCard({
    super.key,
    required this.index,
    this.text,
    this.isDammy = false,
  });
  final int index;
  final String? text;
  final bool isDammy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = 55.h;
    final w = 35.w;
    final textStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 40.h,
    );

    final gameSession = ref.watch(sGameSessionNotifierProvider);
    final openDigitNum = ref.watch(sOpenDigitsNumNotifierProvider);
    final score = ref.watch(sScoreNotifierProvider);
    final globalObjectKeyList = ref.watch(
        globalObjectKeyListProvider(length: gameSession.constValue.length));

    final constValueAbove = gameSession.constValue.substring(0, 2);
    final constValueBelow = gameSession.constValue.substring(2);

    Color chooseColor() {
      if (index + 1 < score) {
        return Colors.green;
      }
      Color color = Colors.red;
      if (score >= gameSession.displayConstData.highscore &&
          index + 1 == score) {
        color = Colors.blue;
      }
      if (score < gameSession.displayConstData.highscore &&
          index + 1 == gameSession.displayConstData.highscore) {
        color = Colors.blue;
      }
      return color;
    }

    Widget frontCard() {
      return SizedBox(
        height: h,
        width: w,
        child: Container(
          margin: EdgeInsets.all(2.0.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: chooseColor().withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: const Offset(1, 1)),
            ],
          ),
          child: Center(
            child: Text(
              index == -1 ? constValueAbove : constValueBelow[index],
              style: textStyle,
            ),
          ),
        ),
      );
    }

    Widget backCard() {
      return SizedBox(
        height: h,
        width: w,
        child: Container(
          margin: EdgeInsets.all(2.0.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: chooseColor().withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: const Offset(1, 1)),
            ],
          ),
          child: Center(
            child: Text(
              index == -1 ? '?.' : '?',
              style: textStyle,
            ),
          ),
        ),
      );
    }

    useEffect(() {
      int shouldBeFrontInd = openDigitNum - 1;
      for (int i = 0; i < globalObjectKeyList.length; i++) {
        if (globalObjectKeyList[i].currentState == null) {
          continue;
        }
        ; // -1 is above constValue
        if (i <= shouldBeFrontInd !=
            globalObjectKeyList[i].currentState!.isFront) {
          globalObjectKeyList[i].currentState!.toggleCard();
        }
      }
      return () {};
    }, [openDigitNum]);

    return index == -2
        ? SizedBox(
            height: h,
            width: w,
            child: Center(
              child: Text(
                '${text ?? ''}',
                style: TextStyle(fontSize: 15.h),
              ),
            ))
        : FlipCard(
            side: CardSide.BACK,
            key: !isDammy ? globalObjectKeyList[index + 1] : null,
            flipOnTouch: false,
            front: frontCard(),
            back: backCard(),
          );
  }
}
