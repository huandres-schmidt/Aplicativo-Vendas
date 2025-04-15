import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/cliente_local_repository.dart';

class ClienteLocalRepositoryImpl extends BaseLocalDataSource<ClienteModel>
  implements ClienteLocalRepository{

  ClienteLocalRepositoryImpl(ApplicationDatabase applicationDatabase)
      : super(
        applicationDatabase,
        TableName.tabelaCliente,
        ClienteModel.fromMap,
  );
  @override
  Future<void> save(ClienteModel cliente) async => insert(cliente);
}