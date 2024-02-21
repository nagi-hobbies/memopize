import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/memorize_page/list_key.dart';
import 'package:memopize/application/state/memorize_page/s_animated_list_model.dart';
import 'package:memopize/application/state/memorize_page/s_is_waitng_input.dart';
import 'package:memopize/application/state/memorize_page/s_open_digits_num.dart';
import 'package:memopize/application/state/s_game_session.dart';
import 'package:memopize/presentation/widgets/common/card_element.dart';
import 'package:memopize/presentation/widgets/memorizing_page/row_view.dart';

class AnimatedListView extends HookConsumerWidget {
  const AnimatedListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewHeight = 260.0.h;

    final listKey = ref.watch(listKeyProvider);
    final animatedListModel = ref.watch(sAnimatedListModelNotifierProvider);
    final openDigitNum = ref.watch(sOpenDigitsNumNotifierProvider);
    final isWaiting = ref.watch(sIsWaitingInputNotifierProvider);
    final gameSession = ref.watch(sGameSessionNotifierProvider);

    final isReverse = useState(false); // アイテムビルダーのアニメーションを反転させるかどうか

    Widget _itemBuilder(
      BuildContext context,
      int index,
      Animation<double> animation,
    ) {
      return SizeTransition(
        axisAlignment: 1 - animation.value,
        sizeFactor: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: isReverse.value ? const Offset(-3, 0) : const Offset(3, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: RowView(colIndex: animatedListModel[index]),
        ),
      );
    }

    Widget _removedItemBuilder(
      BuildContext context,
      Animation<double> animation,
    ) {
      return SizeTransition(
        axisAlignment: 1 - animation.value,
        sizeFactor: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: isReverse.value ? const Offset(3, 0) : const Offset(-3, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: RowView(
              isDammy: true,
              colIndex: openDigitNum ~/ gameSession.rowLength - 1),
        ),
      );
    }

    // 次の行へ移る処理
    void _next() {
      listKey.currentState?.removeItem(0, _removedItemBuilder);
      ref.read(sAnimatedListModelNotifierProvider.notifier).remove();
      ref.read(sAnimatedListModelNotifierProvider.notifier).add();
      Future.delayed(const Duration(milliseconds: 200), () {
        listKey.currentState?.insertItem(
          animatedListModel.length - 1,
        );
      });
    }

    // 前の行へ戻る処理
    void _back() {
      isReverse.value = true;
      listKey.currentState
          ?.removeItem(animatedListModel.length - 1, _removedItemBuilder);
      ref.read(sAnimatedListModelNotifierProvider.notifier).reverseRemove();
      ref.read(sAnimatedListModelNotifierProvider.notifier).reverseAdd();
      Future.delayed(const Duration(milliseconds: 200), () {
        listKey.currentState?.insertItem(0);
      }).then((_) {
        Future.delayed(const Duration(milliseconds: 500), () {
          isReverse.value = false;
        });
      });
    }

    // openDigitNumが変更されたら、アニメーションを実行する
    useEffect(() {
      if (!isWaiting) {
        return null;
      }
      final crrCol = (openDigitNum - 1) ~/ gameSession.rowLength;
      // debugPrint('crrCol: $crrCol, model: ${animatedListModel}');
      if (crrCol == animatedListModel.last) {
        Future.delayed(const Duration(milliseconds: 0), () {
          debugPrint('next');
          _next();
        });
      } else if (crrCol < animatedListModel.first + 1 &&
          animatedListModel.first > 0) {
        Future.delayed(const Duration(milliseconds: 0), () {
          debugPrint('back');
          _back();
        });
      }
      return () {};
    }, [openDigitNum]);

    return CardElement(
        child: SizedBox(
            height: viewHeight,
            child: AnimatedList(
                key: listKey,
                physics: const NeverScrollableScrollPhysics(), // 手動スクロール無効
                initialItemCount: animatedListModel.length,
                itemBuilder: _itemBuilder)));
  }
}
