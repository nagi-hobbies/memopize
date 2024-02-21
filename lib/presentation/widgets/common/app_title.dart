import 'package:flutter/material.dart';
import 'package:memopize/presentation/widgets/common/logo.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(height: 50, child: Center(child: Logo())),
      Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ])),
    ]);
  }
}
