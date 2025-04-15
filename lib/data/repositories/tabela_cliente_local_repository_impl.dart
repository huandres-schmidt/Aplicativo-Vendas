import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/tabela_cliente_local_repository.dart';

import '../../core/constants/db_constants.dart';

class TabelaClienteLocalRepositoryImpl extends BaseLocalDataSource<ClienteModel>
    implements TabelaClienteLocalRepository {

  TabelaClienteLocalRepositoryImpl(ApplicationDatabase applicationDatabase) :
        super(
        applicationDatabase,
        TableName.tabelaCliente,
        ClienteModel.fromMap,
      );
  @override
  Future<List<ClienteModel>> findAllCliente() async => findAll();

  @override
  Future<int> removeCliente(String cnpj) async => rawDelete('''
      DELETE FROM TABELA_CLIENTE WHERE cnpj_cliente = ?
    ''', [cnpj]);

  @override
  Future<void> updateCliente(String cnpj, double credito, String nome) async =>
      rawUpdate('''
      UPDATE tabela_cliente
      SET nome_cliente = ?, limite_credito = ?
      WHERE cnpj_cliente = ?
    ''', [nome, credito, cnpj]);

  @override
  Future<void> updateCreditoCliente(ClienteModel clienteModel) async => rawUpdate(
      '''
    UPDATE TABELA_CLIENTE
    SET limite_credito = ?
    WHERE cnpj_cliente = ?
    ''',
      [clienteModel.limiteCredito, clienteModel.cnpj]
  );
}
