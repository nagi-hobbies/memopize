import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/presentation/widgets/memorizing_page/digit_card.dart';

class RowView extends ConsumerWidget {
  const RowView({super.key, required this.colIndex, this.isDammy = false});
  final int colIndex;
  final isDammy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSession = ref.watch(sGameSessionNotifierProvider);
    // return Padding(
    //   padding: EdgeInsets.all(5.0.h),
    return SizedBox(
      height: 65.h,
      child: Padding(
        padding: EdgeInsets.all(5.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            colIndex == 0
                ? DigitCard(
                    index: -1,
                    isDammy: isDammy,
                  )
                : DigitCard(
                    isDammy: isDammy,
                    index: -2,
                    text: (colIndex * gameSession.rowLength).toString()),
            ...List.generate(gameSession.rowLength, (rowIndex) {
              return DigitCard(
                  isDammy: isDammy,
                  index: colIndex * gameSession.rowLength + rowIndex);
            })
          ],
        ),
      ),
    );
  }
}
