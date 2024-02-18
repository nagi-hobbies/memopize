import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/presentation/pages/collection_page.dart';
import 'package:memopize/presentation/pages/_game_page.dart';
import 'package:memopize/presentation/pages/memorize_page.dart';
import 'package:memopize/presentation/pages/select_page.dart';
import 'package:memopize/presentation/pages/title_page.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routes = [
    GoRoute(
      path: PageId.game.path,
      name: PageId.game.routeName,
      builder: (context, state) {
        final constId = state.pathParameters['constId']!;
        return GamePage(constId: constId);
      },
      onExit: (context) async {
        final usecase = ref.read(exitGamePageUseCaseProvider);
        await usecase.call();
        return true;
      },
    ),
    GoRoute(
        path: PageId.collection.path,
        name: PageId.collection.routeName,
        builder: (context, state) {
          return const CollectionPage();
        }),
    GoRoute(
      path: PageId.select.path,
      name: PageId.select.routeName,
      builder: (context, state) {
        return const SelectPage();
      },
    ),
    GoRoute(
      path: PageId.title.path,
      name: PageId.title.routeName,
      builder: (context, state) {
        return const TitlePage();
      },
    ),
    GoRoute(
        path: PageId.memorize.path,
        name: PageId.memorize.routeName,
        builder: (context, state) {
          return const MemorizePage();
        },
        onExit: (context) async {
          final usecase = ref.read(exitGamePageUseCaseProvider);
          await usecase.call();
          return true;
        }),
  ];
  return GoRouter(
    initialLocation: PageId.title.path,
    debugLogDiagnostics: false,
    routes: routes,
  );
}
