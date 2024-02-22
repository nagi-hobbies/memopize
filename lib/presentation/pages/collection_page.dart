import 'package:flutter/material.dart';
import 'package:memopize/presentation/widgets/collection_page/consts_list_view.dart';
import 'package:memopize/presentation/widgets/common/app_title.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppTitle(),
          backgroundColor: const Color(0xff395886),
        ),
        backgroundColor: const Color(0xfff9fafe),
        body: const ConstListView());
  }
}
