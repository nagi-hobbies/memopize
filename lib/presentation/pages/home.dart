import 'package:flutter/material.dart';
import 'package:memopize/presentation/widgets/consts_listview.dart';
import 'package:memopize/presentation/widgets/strict_num_button_panel.dart';

import '../widgets/rnd_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Template App'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              RndButton(),
              ConstsListView(),
              StrictNumButtonPanel()
            ])));
  }
}
