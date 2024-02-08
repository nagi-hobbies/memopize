import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/state/s_themeseed.dart';
import 'presentation/pages/home.dart';
import 'presentation/theme/theme.dart';

void main() {
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color themeSeed = ref.watch(sThemeSeedNotifierProvider);

    return MaterialApp(
      title: 'Theme Tutorial',
      theme: createThemeData(themeSeed, Brightness.light),
      darkTheme: createThemeData(themeSeed, Brightness.dark),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
