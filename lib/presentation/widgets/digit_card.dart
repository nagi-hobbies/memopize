import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class DigitCard extends StatelessWidget {
  const DigitCard({
    super.key,
    required this.globalKey,
    required this.digitText,
    required this.color,
    this.initSide = CardSide.FRONT,
    this.isDammy = false,
  });
  final bool isDammy;
  final GlobalKey globalKey;
  final String digitText;
  final Color color;
  final CardSide initSide;

  @override
  Widget build(BuildContext context) {
    final spreadRadius = 1.0;
    final blurRadius = 5.0;
    final shadowOffset = const Offset(1, 1);

    return isDammy
        ? Expanded(child: Container())
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: FlipCard(
                key: globalKey,
                flipOnTouch: false,
                side: initSide,
                front: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        spreadRadius: spreadRadius,
                        blurRadius: blurRadius,
                        offset: shadowOffset,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '?',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                back: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        spreadRadius: spreadRadius,
                        blurRadius: blurRadius,
                        offset: shadowOffset,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      digitText,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
