import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memopize/domain/features/desktop_initializer.dart';
import 'package:memopize/presentation/router/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux) {
    // sqfliteをデスクトップアプリで使うための初期化
    DesktopInitializer.sqfliteInit();
    DesktopInitializer.windowSizeInit();
  }

  LicenseRegistry.addLicense(() async* {
    final license1 =
        await rootBundle.loadString('google_fonts/MPLUSRounded1c/OFL.txt');
    final license2 =
        await rootBundle.loadString('google_fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license1 + license2);
  });

  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}
