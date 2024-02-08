import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/presentation/widgets/consts_listview.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';

import '../../application/state/s_play_settings.dart';
import '../widgets/rnd_button.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Template App'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                  onPressed: () => {
                        ref
                            .read(sPlaySettingsNotifierProvider.notifier)
                            .setRowLength(ref
                                    .read(sPlaySettingsNotifierProvider)
                                    .rowLength +
                                1),
                        debugPrint(ref
                            .read(sPlaySettingsNotifierProvider)
                            .rowLength
                            .toString())
                      },
                  child: const Text('Increment Row Length')),
              RndButton(),
              ConstsListView(),
              const StrictButtonPanel()
            ])));
  }
}
