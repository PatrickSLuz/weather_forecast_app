import 'dart:developer';

import 'package:weather_forecast_app/app/shared/database/app_database.dart';
import 'package:weather_forecast_app/app/shared/database/helpers/sqflite_helper.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase implements AppDatabase {
  Future<Database> get _database => SqfliteHelper.database;

  @override
  Future<Map<String, dynamic>> get(
    final String tableName,
    final String where,
    final List<dynamic> whereArgs,
  ) async {
    final db = await _database;
    final result = await db.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
    log('Database: SELECT $tableName - args: $whereArgs');
    return result.isNotEmpty ? result.first : {};
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(final String tableName) async {
    final db = await _database;
    final result = await db.query(tableName);
    log('Database: SELECT $tableName');
    return result;
  }

  @override
  Future<num> insert(
    final String tableName,
    final Map<String, dynamic> value,
  ) async {
    final db = await _database;
    final id = await db.transaction((txn) async {
      return txn.insert(
        tableName,
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    log('Database: INSERT $tableName - id: $id');
    return id;
  }

  @override
  Future<void> update(
    final String tableName,
    final Map<String, dynamic> value,
    final String? where,
    final List<dynamic>? whereArgs,
  ) async {
    final db = await _database;
    final rowsAffected = await db.update(
      tableName,
      value,
      where: where,
      whereArgs: whereArgs,
    );
    log('Database: UPDATE $tableName - $rowsAffected rows affected');
  }

  @override
  Future<void> delete(
    final String tableName,
    final String column,
    final int id,
  ) async {
    final db = await _database;
    final rowsAffected = await db.delete(
      tableName,
      where: '$column = ?',
      whereArgs: [id],
    );
    log('Database: DELETE $tableName - $rowsAffected rows affected');
  }
}
