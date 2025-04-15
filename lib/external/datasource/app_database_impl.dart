import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class ApplicationDatabaseImpl implements ApplicationDatabase{
  static ApplicationDatabaseImpl? _instance;

  static Future<ApplicationDatabaseImpl> initialize() async =>
      _instance ??= ApplicationDatabaseImpl._(await _initialize());

  ApplicationDatabaseImpl._(Database database) : db = database;

  @override
  Database db;

  static Future<Database> _initialize() async {

    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DataBaseConstants.nomeBd);

    var db = await openDatabase(
      path,
      version: DataBaseConstants.versaoBd,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: onDatabaseDowngradeDelete
    );
    return db;
  }

  static void _onCreate(Database db, int newVersion) async {
    String s = await rootBundle.loadString(DataBaseConstants.create);

    List<String> sqls = s.split(';');

    for (String sql in sqls) {
      if (sql.trim().isNotEmpty) {
        await db.execute(sql);
      }
    }
  }

  static Future<FutureOr<void>> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    /// Verifica a versão atual e nova versão do banco de dados
    if (oldVersion < DataBaseConstants.versaoBd) {
      /// Pega a partir da versão atual
      for (int i = oldVersion + 1; i <= DataBaseConstants.versaoBd; i++) {
        try {
          /// Abre o arquivo
          String s = await rootBundle
              .loadString('${DataBaseConstants.pathUpgrade}$i.sql');

          List<String> sqls = s.split(";");

          for (String sql in sqls) {
            if (sql.trim().isNotEmpty) {
              try {
                /// Executa a instrução  SQL
                await db.execute(sql);
              } on Exception catch (_) {
                continue;
              }
            }
          }
        } on Exception catch (e) {
          if (kDebugMode) {
            print(e);
          }
          continue;
        }
      }
    }
  }
}