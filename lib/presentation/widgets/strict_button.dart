import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StrictButton extends ConsumerWidget {
  const StrictButton(
      {super.key, required this.onPressed, required this.number});
  final VoidCallback? onPressed;
  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(number.toString()),
    );
  }
}
