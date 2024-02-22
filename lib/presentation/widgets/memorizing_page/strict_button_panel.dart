import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/memorize_page/s_is_waitng_input.dart';
import 'package:memopize/presentation/widgets/memorizing_page/strict_button.dart';

class StrictButtonPanel extends ConsumerWidget {
  /// strict mode での数字ボタンパネル
  const StrictButtonPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWaitingInput = ref.watch(sIsWaitingInputNotifierProvider);

    // getOnPressedFunc
    void onPressed(int pressedNum) {
      final usecase = ref.read(pressedNumUseCaseProvider);
      usecase.pressedNum(pressedNum);
    }

    return Container(
      child: Column(children: [
        ...List.generate(
            3,
            (colInd) => Expanded(
                    child: FractionallySizedBox(
                  child: Row(
                      children: List.generate(
                          3,
                          (rowInd) => Expanded(
                                  child: SizedBox(
                                height: double.infinity,
                                child: StrictButton(
                                  onPressed: isWaitingInput
                                      ? () => onPressed(colInd * 3 + rowInd + 1)
                                      : null,
                                  number: colInd * 3 + rowInd + 1,
                                ),
                              )))),
                ))),
        Expanded(
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: StrictButton(
                    onPressed: isWaitingInput ? () => onPressed(0) : null,
                    number: 0,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: StrictButton(
                      onPressed: !isWaitingInput
                          ? () {
                              final usecase =
                                  ref.read(pressedContinueUseCaseProvider);
                              usecase.call();
                            }
                          : null,
                      number: -1),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
