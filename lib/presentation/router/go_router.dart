import 'package:flutter/material.dart';
import 'package:memopize/application/di/usecases.dart';
import 'package:memopize/presentation/pages/collection_page.dart';
import 'package:memopize/presentation/pages/memorizing_page.dart';
import 'package:memopize/presentation/pages/title_page.dart';
import 'package:memopize/presentation/router/page_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routes = [
    GoRoute(
        path: PageId.collection.path,
        name: PageId.collection.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const CollectionPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              });
        }),
    GoRoute(
        path: PageId.title.path,
        name: PageId.title.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const TitlePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        }),
    GoRoute(
        path: PageId.memorize.path,
        name: PageId.memorize.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const MemorizingPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeOutBack)),
                ),
                child: child,
              );
            },
          );
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
