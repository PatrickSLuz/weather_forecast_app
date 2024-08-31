import 'package:weather_forecast_app/app/features/search/data/adapters/city_adapter.dart';
import 'package:weather_forecast_app/app/shared/database/app_database.dart';
import 'package:weather_forecast_app/app/shared/database/helpers/city_database_helper.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_repository.dart';

class CityRepositoryImpl implements ICityRepository {
  final AppDatabase database;

  CityRepositoryImpl(this.database);

  @override
  Future<List<CityModel>> getAll() async {
    final result = await database.getAll(CityDatabaseHelper.tableName);
    if (result.isEmpty) return [];
    return result.map((e) => CityAdapter.fromDbMap(e)).toList();
  }

  @override
  Future<num> save(CityModel city) async {
    if (city.id != null) return city.id!;

    final search = await database.get(
      CityDatabaseHelper.tableName,
      '${CityDatabaseHelper.columnName} = ?',
      [city.name],
    );

    if (search.isNotEmpty) {
      final dbCity = CityAdapter.fromDbMap(search);
      city = city.copyWith(id: dbCity.id);
      database.update(
        CityDatabaseHelper.tableName,
        CityAdapter.toDbMap(city),
        '${CityDatabaseHelper.columnId} = ?',
        [dbCity.id],
      );
      return dbCity.id!;
    }

    return database.insert(
      CityDatabaseHelper.tableName,
      CityAdapter.toDbMap(city),
    );
  }

  @override
  Future<void> delete(int id) {
    return database.delete(
      CityDatabaseHelper.tableName,
      CityDatabaseHelper.columnId,
      id,
    );
  }
}
