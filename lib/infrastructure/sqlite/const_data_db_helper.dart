import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:memopize/application/config/database_config.dart';
import 'package:memopize/domain/types/display_const_data.dart';
import 'package:memopize/infrastructure/assets/constants_json_helper.dart';
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
      onCreate: (db, version) async {
        final json = await rootBundle.loadString('assets/jsons/constants.json');
        final map = jsonDecode(json);
        final constants = ConstantsJsonHelper.fromJson(map).constants;
        return db.execute(
          """CREATE TABLE $_tableName (
                id INTEGER PRIMARY KEY,
                category TEXT, 
                tex TEXT, 
                firstthree TEXT,
                value TEXT, 
                nameJa TEXT, 
                nameEn TEXT, 
                descriptionJa TEXT, 
                descriptionEn TEXT, 
                highscore INTEGER
              )
          """,
        ).then((value) => constants.forEach((constant) {
              db.insert(_tableName, <String, dynamic>{
                'category': constant.category,
                'tex': constant.tex,
                'firstthree': constant.firstthree,
                'value': constant.value,
                'nameJa': constant.nameJa,
                'nameEn': constant.nameEn,
                'descriptionJa': constant.descriptionJa,
                'descriptionEn': constant.descriptionEn,
                'highscore': 0,
              });
            }));
      },
      version: _dbVersion,
    );

    // return db
    //     .execute(
    //       "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, name TEXT, highscore INTEGER)",
    //     )
    //     .then((value) => Constants.values.forEach((constant) {
    //           db.insert(_tableName, <String, dynamic>{
    //             'name': constant.name,
    //             'highscore': 0,
    //           });
    //         }));
  }

  static Future<void> updateHighscore(int constId, int highscore) async {
    final Database db = await _openDB();
    await db.update(
      _tableName,
      <String, dynamic>{
        'id': constId,
        'highscore': highscore,
      },
      where: 'id = ?',
      whereArgs: [constId],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }

  static Future<DisplayConstData> getDisplayConstData(
      String constId, String langage) async {
    final Database db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      columns: [
        'id',
        'category',
        'tex',
        'firstthree',
        'nameJa',
        'nameEn',
        'descriptionJa',
        'descriptionEn',
        'highscore'
      ],
      where: 'id = ?',
      whereArgs: [constId],
    );
    await db.close();
    if (maps.isEmpty) {
      throw Exception('No data');
    }
    return DisplayConstData(
      id: maps[0]['id'] - 1, // テーブルのidは1から始まるが、リストのindexは0から始まるため、-1する
      category: maps[0]['category'],
      tex: maps[0]['tex'],
      firstthree: maps[0]['firstthree'],
      name: maps[0]['name$langage'],
      description: maps[0]['description$langage'],
      highscore: maps[0]['highscore'],
    );
  }

  Future<List<DisplayConstData>> getAllDisplayConstData(String langage) async {
    final Database db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      columns: [
        'id',
        'category',
        'tex',
        'firstthree',
        'name$langage',
        'description$langage',
        'highscore'
      ],
    );
    await db.close();
    if (maps.isEmpty) {
      throw Exception('No data');
    }
    return List.generate(maps.length, (i) {
      return DisplayConstData(
        id: maps[i]['id'] - 1,
        category: maps[i]['category'],
        tex: maps[i]['tex'],
        firstthree: maps[i]['firstthree'],
        name: maps[i]['name$langage'],
        description: maps[i]['description$langage'],
        highscore: maps[i]['highscore'],
      );
    });
  }

  static Future<String> getConstValue(int constId) async {
    final Database db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      columns: ['value'],
      where: 'id = ?',
      whereArgs: [constId],
    );
    await db.close();
    if (maps.isEmpty) {
      throw Exception('No data');
    }
    return maps[0]['value'];
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
