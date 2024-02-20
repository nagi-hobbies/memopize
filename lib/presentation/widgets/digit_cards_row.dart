import 'package:flutter/material.dart';

class DigitCardsRow extends StatelessWidget {
  const DigitCardsRow(
      {super.key, required this.children, required this.animation});
  final List<Widget> children;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.1),
      //       spreadRadius: 5,
      //       blurRadius: 7,
      //       offset: Offset(0, 3),
      //     ),
      //   ],
      // ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: children,
        ),
      ),
    );
  }
}
