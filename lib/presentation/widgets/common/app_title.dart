import 'package:flutter/material.dart';
import 'package:memopize/presentation/widgets/common/logo.dart';
import 'package:memopize/presentation/dialogs/setting_dialog.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(height: 50, child: Center(child: Logo())),
      Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const SettingDialog());
            },
            icon: const Icon(Icons.settings)),
      ])),
    ]);
  }
}
