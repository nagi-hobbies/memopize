import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memopize/application/state/s_themeseed.dart';
import 'package:memopize/presentation/router/go_router.dart';
import 'package:memopize/presentation/theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color themeSeed = ref.watch(sThemeSeedNotifierProvider);
    final router = ref.watch(goRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(412, 892), // Pixel 6a
      minTextAdapt: true,

      child: MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: createThemeData(themeSeed, Brightness.light),
        // darkTheme: createThemeData(themeSeed, Brightness.dark),
      ),
    );
  }
}
