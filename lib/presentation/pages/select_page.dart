import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/router/page_path.dart';

class SelectPage extends ConsumerWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ['pi', 'e', 'sqrt2'].map(
              (constName) {
                return ElevatedButton(
                  onPressed: () async {
                    final usecase = ref
                        .read(loadConstDataUseCaseNotifierProvider(constName));
                    await usecase.loadConstData();
                    final router = ref.read(goRouterProvider);
                    router.goNamed(
                      PageId.game.routeName,
                      pathParameters: {'constName': constName},
                    );
                  },
                  child: Text('Game Page (${constName})'),
                );
              },
            ).toList(),
          ),
        ));
  }
}
