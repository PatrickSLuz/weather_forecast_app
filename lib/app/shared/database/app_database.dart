abstract class AppDatabase {
  Future<num> insert(
    String tableName,
    Map<String, dynamic> value,
  );

  Future<void> update(
    String tableName,
    Map<String, dynamic> value,
    String? where,
    List<dynamic>? whereArgs,
  );

  Future<Map<String, dynamic>> get(
    String tableName,
    String where,
    List<dynamic> whereArgs,
  );

  Future<List<Map<String, dynamic>>> getAll(
    String tableName,
  );

  Future<void> delete(
    String tableName,
    String column,
    int id,
  );
}
