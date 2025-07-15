class CityTable {
  CityTable._();

  static const tableName = 'city_table';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnState = 'state';
  static const columnCountryCode = 'country_code';
  static const columnLat = 'lat';
  static const columnLng = 'lng';

  static const createTableQuery = '''
      CREATE TABLE $tableName(
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnState TEXT,
            $columnCountryCode TEXT,
            $columnLat REAL NOT NULL,
            $columnLng REAL NOT NULL
          )
    ''';
}
