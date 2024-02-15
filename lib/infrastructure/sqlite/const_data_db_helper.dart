import 'dart:convert';

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
        List<InnerConstantsJsonHelper> constants =
            ConstantsJsonHelper.fromJson(map).constants.toList();
        constants.sort((a, b) => a.id.compareTo(b.id));
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
        ).then((value) => {
              for (var constant in constants)
                {
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
                  })
                }
            });
      },
      version: _dbVersion,
    );
  }

  static Future<void> updateHighscore(int constId, int highscore) async {
    final Database db = await _openDB();
    final a = await db.update(
      _tableName,
      <String, dynamic>{
        'highscore': highscore,
      },
      where: 'id = ?',
      whereArgs: [constId + 1],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }

  static Future<DisplayConstData> getDisplayConstData(
      int constId, String langage) async {
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
      whereArgs: [constId + 1],
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
      whereArgs: [constId + 1], // テーブルのidは1から始まるが、リストのindexは0から始まるため、+1する
    );
    await db.close();
    if (maps.isEmpty) {
      throw Exception('No data');
    }
    return maps[0]['value'];
  }

  static Future<List<Map<String, dynamic>>> getAllDataInTable() async {
    final Database db = await _openDB();
    final tables = await db.query(_tableName);
    await db.close();
    return tables;
  }
}
