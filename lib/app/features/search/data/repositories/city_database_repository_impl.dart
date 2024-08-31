import 'package:weather_forecast_app/app/features/search/data/adapters/city_adapter.dart';
import 'package:weather_forecast_app/core/local_database/i_local_database.dart';
import 'package:weather_forecast_app/core/local_database/tables/city_table.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_database_repository.dart';

class CityDatabaseRepositoryImpl implements ICityDatabaseRepository {
  final ILocalDatabase localDatabase;

  CityDatabaseRepositoryImpl(this.localDatabase);

  @override
  Future<List<CityModel>> getAll() async {
    final result = await localDatabase.getAll(CityTable.tableName);
    if (result.isEmpty) return [];
    return result.map((e) => CityAdapter.fromDbMap(e)).toList();
  }

  @override
  Future<num> save(CityModel city) async {
    if (city.id != null) return city.id!;

    final search = await localDatabase.get(
      CityTable.tableName,
      '${CityTable.columnName} = ?',
      [city.name],
    );

    if (search.isNotEmpty) {
      final dbCity = CityAdapter.fromDbMap(search);
      city = city.copyWith(id: dbCity.id);
      localDatabase.update(
        CityTable.tableName,
        CityAdapter.toDbMap(city),
        '${CityTable.columnId} = ?',
        [dbCity.id],
      );
      return dbCity.id!;
    }

    return localDatabase.insert(
      CityTable.tableName,
      CityAdapter.toDbMap(city),
    );
  }

  @override
  Future<void> delete(int id) {
    return localDatabase.delete(
      CityTable.tableName,
      CityTable.columnId,
      id,
    );
  }
}
