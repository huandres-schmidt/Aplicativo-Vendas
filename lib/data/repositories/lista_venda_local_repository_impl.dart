import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/lista_venda_local_repository.dart';

class ListaVendaLocalRepositoryImpl extends BaseLocalDataSource<VendaDatabaseModel>
    implements ListaVendaLocalRepository {

  ListaVendaLocalRepositoryImpl(ApplicationDatabase applicationDatabase)
      : super(
        applicationDatabase,
        TableName.tabelaVenda,
        VendaDatabaseModel.fromMap,
      );
  @override
  Future<List<VendaDatabaseModel>> findAllVenda() async => findAll();
  }