import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_is_waitng_input.dart';
import 'package:memopize/presentation/widgets/strict_button.dart';

class StrictButtonPanel extends ConsumerWidget {
  final double w = 80;
  final double h = 80;

  /// strict mode での数字ボタンパネル
  const StrictButtonPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWaitingInput = ref.watch(sIsWaitingInputNotifierProvider);

    // getOnPressedFunc
    void onPressed(int pressedNum) {
      final usecase = ref.read(pressedNumUseCaseNotifierProvider);
      usecase.pressedNum(pressedNum);
    }

    return SizedBox(
      width: w * 3,
      height: h * 4,
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(), // scroll禁止
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            ...List.generate(
                9,
                (index) => SizedBox(
                      width: w,
                      height: h,
                      child: StrictButton(
                          onPressed: isWaitingInput
                              ? () => onPressed(index + 1)
                              : null,
                          number: index + 1),
                    )),
            SizedBox(
              width: w,
              height: h,
            ),
            SizedBox(
                width: w,
                height: h,
                child: StrictButton(
                    onPressed: isWaitingInput ? () => onPressed(0) : null,
                    number: 0)),
            SizedBox(
              width: w,
              height: h,
            )
          ]),
    );
  }
}
