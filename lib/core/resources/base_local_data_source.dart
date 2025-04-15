import 'package:projeto_estagio_vendas/core/resources/base_model.dart';

import '../../data/datasource/app_database.dart';

abstract class BaseLocalDataSource<T extends BaseModel> {
  final ApplicationDatabase _applicationDatabase;
  final String _tableName;
  final Function _fromMap;

  BaseLocalDataSource(
    this._applicationDatabase,
    this._tableName,
    this._fromMap,
  );

  Future<int> insert(T model) async =>
      _applicationDatabase.db.insert(_tableName, model.toMap());

  Future<List<T>> findAll() async => _applicationDatabase.db
      .query(_tableName)
      .then((value) => value.map<T>((e) => _fromMap(e)).toList());

  Future<int> delete({String? where, List<Object?>? whereArgs}) async =>
      _applicationDatabase.db.delete(_tableName, where: where, whereArgs: whereArgs);

  Future<int> rawUpdate(String query, [List<Object?>? arguments]) async =>
      _applicationDatabase.db.rawUpdate(query, arguments);

  Future<int> rawDelete(String query, [List<Object?>? arguments]) async =>
      _applicationDatabase.db.rawDelete(query, arguments);

  Future<List<Map<String, Object?>>> rawQuery(String sql, [List<Object?>? arguments]) async =>
      _applicationDatabase.db.rawQuery(sql, arguments);
}
