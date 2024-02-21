import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_size/window_size.dart';

class DesktopInitializer {
  static void sqfliteInit() {
    // sqfliteをデスクトップアプリで使うための初期化
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  static Future<void> windowSizeInit() async {
    setWindowFrame(const Rect.fromLTWH(0, 0, 600, 800));
    setWindowMinSize(const Size(600, 800));
  }
}
