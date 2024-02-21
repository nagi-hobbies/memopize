import 'package:flutter/material.dart';

class CardElement extends StatelessWidget {
  const CardElement(
      {super.key,
      required this.child,
      this.borderRadius = const BorderRadius.all(Radius.circular(10))});
  final Widget child;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
