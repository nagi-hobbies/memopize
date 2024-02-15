import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memopize/application/state/s_display_const_data_list.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';

class TitlePage extends HookConsumerWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final displayConstDataList =
    //     ref.watch(sDisplayConstDataListNotifierProvider);
    Future<List<DisplayConstData>> displayConstDataList =
        ConstValueDBHelper().getAllDisplayConstData('Ja');
    useEffect(() {
      final sDisplayConstDataListNotifier =
          ref.read(sDisplayConstDataListNotifierProvider.notifier);
      displayConstDataList.then((value) {
        sDisplayConstDataListNotifier.set(value);
      });
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                final router = ref.read(goRouterProvider);
                router.goNamed(
                  PageId.select.routeName,
                );
              },
              child: FutureBuilder(
                future: displayConstDataList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const Text('Select Page');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
