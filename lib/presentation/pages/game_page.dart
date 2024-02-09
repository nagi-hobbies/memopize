import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/state/s_const_data.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:memopize/presentation/widgets/consts_listview.dart';
import 'package:memopize/presentation/widgets/strict_button_panel.dart';

import '../widgets/rnd_button.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key, required this.constName});
  final String constName;

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
              RndButton(),
              ConstsListView(),
              StrictButtonPanel(),
              ElevatedButton(
                  onPressed: () {
                    ref.read(sConstDataNotifierProvider.notifier).clear();
                    final router = ref.read(goRouterProvider);
                    router.goNamed(
                      PageId.select.routeName,
                    );
                  },
                  child: const Text('Select Page')),
            ])));
  }
}
