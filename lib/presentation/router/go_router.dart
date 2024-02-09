import 'package:memopize/presentation/pages/game_page.dart';
import 'package:memopize/presentation/pages/select_page.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(ref) {
  final routes = [
    GoRoute(
        path: PageId.game.path,
        name: PageId.game.name,
        builder: (context, state) {
          final constName = state.pathParameters['constName']!;
          return GamePage(constName: constName);
        }),
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
