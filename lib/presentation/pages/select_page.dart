import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/domain/types/constants.dart';
import 'package:memopize/infrastructure/sqlite/const_data_db_helper.dart';
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
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Constants.values.map(
                  (constant) {
                    return ElevatedButton(
                      onPressed: () async {
                        final usecase = ref.read(
                            startGameSessionUseCaseProvider(constant.name));
                        await usecase.call();
                        final router = ref.read(goRouterProvider);
                        router.goNamed(
                          PageId.game.routeName,
                          pathParameters: {'constName': constant.name},
                        );
                      },
                      child: Text('Game Page (${constant.name})'),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ));
  }
}
