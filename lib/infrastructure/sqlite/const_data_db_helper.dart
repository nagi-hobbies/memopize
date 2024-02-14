import 'package:memopize/application/config/database_config.dart';
import 'package:memopize/domain/types/const_data.dart';
import 'package:memopize/domain/types/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConstValueDBHelper {
  static final String _DB_NAME = CONST_DATA_DB_NAME;
  static final int _DB_VERSION = CONST_DATA_DB_VERSION;
  static final dynamic _TABLE_NAME = CONST_DATA_DB_TABLE_NAME;
  // static const String _TABLE_NAME = 'consts';

  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _DB_NAME),
      onCreate: (db, version) {
        return db
            .execute(
              "CREATE TABLE $_TABLE_NAME (id INTEGER PRIMARY KEY, path TEXT, highscore INTEGER)",
            )
            .then((value) => Constants.values.forEach((constant) {
                  db.insert(_TABLE_NAME, <String, dynamic>{
                    'path': constant.path,
                    'highscore': 0,
                  });
                }));
      },
      version: _DB_VERSION,
    );
  }

  static Future<void> updateHighscore(String constPath, int highscore) async {
    final Database db = await _openDB();
    await db.update(
      _TABLE_NAME,
      <String, dynamic>{
        'path': constPath,
        'highscore': highscore,
      },
      where: 'path = ?',
      whereArgs: [constPath],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }

  static Future<ConstData> getConstData(String constPath) async {
    final Database db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query(
      _TABLE_NAME,
      columns: ['path', 'highscore'],
      where: 'path = ?',
      whereArgs: [constPath],
    );
    await db.close();
    if (maps.isEmpty) {
      return ConstData(path: constPath, highscore: 0);
    }
    return ConstData(path: maps[0]['path'], highscore: maps[0]['highscore']);
  }

  static Future<List<Map<String, dynamic>>> getAllTableinDB() async {
    // get all table in db
    final Database db = await _openDB();
    final tables = await db
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    await db.close();
    return tables;
  }
}
