import 'package:memopize/application/config/database_config.dart';
import 'package:memopize/domain/types/const_data.dart';
import 'package:memopize/domain/types/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConstValueDBHelper {
  static final String _dbName = CONST_DATA_DB_NAME;
  static final int _dbVersion = CONST_DATA_DB_VERSION;
  static final dynamic _tableName = CONST_DATA_DB_TABLE_NAME;
  // static const String _TABLE_NAME = 'consts';

  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db
            .execute(
              "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, name TEXT, highscore INTEGER)",
            )
            .then((value) => Constants.values.forEach((constant) {
                  db.insert(_tableName, <String, dynamic>{
                    'name': constant.name,
                    'highscore': 0,
                  });
                }));
      },
      version: _dbVersion,
    );
  }

  static Future<void> updateHighscore(String constName, int highscore) async {
    final Database db = await _openDB();
    await db.update(
      _tableName,
      <String, dynamic>{
        'name': constName,
        'highscore': highscore,
      },
      where: 'name = ?',
      whereArgs: [constName],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }

  static Future<ConstData> getConstData(String constName) async {
    final Database db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      columns: ['name', 'highscore'],
      where: 'name = ?',
      whereArgs: [constName],
    );
    await db.close();
    if (maps.isEmpty) {
      return ConstData(name: constName, highscore: 0);
    }
    return ConstData(name: maps[0]['name'], highscore: maps[0]['highscore']);
  }

  static Future<List<Map<String, dynamic>>> getAllTableinDB() async {
    // get all table in db
    final Database db = await _openDB();
    final tables = await db
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    await db.close();
    return tables;
  }

  //get all data in const table
  static Future<List<Map<String, dynamic>>> getAllDataInTable() async {
    final Database db = await _openDB();
    final tables = await db.query(_tableName);
    await db.close();
    return tables;
  }
}
