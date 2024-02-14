import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/application/state/s_score.dart';
import 'package:memopize/presentation/pages/game_page.dart';
import 'package:memopize/presentation/pages/select_page.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(ref) {
  String constPath = '';
  final routes = [
    GoRoute(
      path: PageId.game.path,
      name: PageId.game.name,
      builder: (context, state) {
        final constName = state.pathParameters['constPath']!;
        constPath = constName;
        return GamePage(constPath: constName);
      },
      onExit: (context) async {
        final usecase = ref.read(exitGamePageUseCaseNotifierProvider);
        await usecase.call(
            constPath, ref.read(sScoreNotifierProvider.notifier).value);
        return true;
      },
    ),
    GoRoute(
      path: PageId.select.path,
      name: PageId.select.name,
      builder: (context, state) {
        return const SelectPage();
      },
    ),
  ];
  return GoRouter(
    initialLocation: PageId.select.path,
    debugLogDiagnostics: false,
    routes: routes,
  );
}
