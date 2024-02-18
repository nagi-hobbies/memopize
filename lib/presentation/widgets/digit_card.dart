import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_global_object_key_list.dart';

class DigitCard extends ConsumerWidget {
  const DigitCard({
    super.key,
    required this.controller,
    required this.digitText,
    required this.color,
    required this.id,
    this.initSide = CardSide.FRONT,
    this.isDammy = false,
  });
  final FlipCardController controller;
  final bool isDammy;
  final String digitText;
  final Color color;
  final int id;
  final CardSide initSide;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalObjectKeyList = ref.watch(globalObjectKeyListProvider);
    final spreadRadius = 1.0;
    final blurRadius = 5.0;
    final shadowOffset = const Offset(1, 1);
    final opacity = 0.3;

    final textStyle = const TextStyle(
      fontSize: 40,
    );
    return isDammy
        ? Expanded(child: Container())
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: FlipCard(
                key: id >= 0 ? globalObjectKeyList[id] : null,
                controller: controller,
                flipOnTouch: false,
                side: initSide,
                front: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(opacity),
                        spreadRadius: spreadRadius,
                        blurRadius: blurRadius,
                        offset: shadowOffset,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '?',
                      style: textStyle,
                    ),
                  ),
                ),
                back: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(opacity),
                        spreadRadius: spreadRadius,
                        blurRadius: blurRadius,
                        offset: shadowOffset,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(digitText, style: textStyle),
                  ),
                ),
              ),
            ),
          );
  }
}
