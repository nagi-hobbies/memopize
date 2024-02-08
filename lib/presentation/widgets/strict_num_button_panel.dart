import 'package:flutter/material.dart';

class StrictNumButtonPanel extends StatelessWidget {
  final double w = 80;
  final double h = 80;
  const StrictNumButtonPanel({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: ElevatedButton(
                          onPressed: () => debugPrint('${index + 1}'),
                          child: Text((index + 1).toString())),
                    )),
            SizedBox(
              width: w,
              height: h,
            ),
            SizedBox(
                width: w,
                height: h,
                child: ElevatedButton(
                    onPressed: () => debugPrint('0'), child: const Text('0'))),
            SizedBox(
              width: w,
              height: h,
            )
          ]),
    );
  }
}
