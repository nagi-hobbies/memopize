import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StrictButton extends ConsumerWidget {
  const StrictButton(
      {super.key, required this.onPressed, required this.number});
  final VoidCallback? onPressed;
  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: number == -1
              ? Icon(Icons.play_arrow)
              : Text(number.toString(), style: TextStyle(fontSize: 40)),
        ),
      ),
    );
  }
}
