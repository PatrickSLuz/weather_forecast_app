import 'package:sqflite/sqflite.dart';
import 'package:weather_forecast_app/app/data/database/helpers/city_database_helper.dart';

class SqfliteHelper {
  SqfliteHelper._();

  static const _databaseName = 'weather_app_database';
  static const _databaseVersion = 1;

  static Database? _database;

  static Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      '$dbPath/$_databaseName',
      onCreate: (db, _) {
        db.execute(CityDatabaseHelper.createTableQuery);
      },
      version: _databaseVersion,
    );
  }
}
