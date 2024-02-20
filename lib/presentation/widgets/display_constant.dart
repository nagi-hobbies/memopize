import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/presentation/widgets/balloon_card.dart';

class DisplayConstant extends StatelessWidget {
  const DisplayConstant(
      {super.key, required this.displayConstData, required this.tailPos});
  final DisplayConstData displayConstData;
  final double tailPos;

  @override
  Widget build(BuildContext context) {
    return BalloonCard(
      tailPos: tailPos,
      tailLength: 0.1,
      tailHalfWidth: 0.1,
      conerRadius: 30,
      elevation: 5.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(displayConstData.category),
          Text(displayConstData.tex),
          Text(displayConstData.firstthree),
          Text(displayConstData.name),
          Text(displayConstData.description),
          Text(displayConstData.highscore.toString()),
        ],
      ),
    );
  }
}
