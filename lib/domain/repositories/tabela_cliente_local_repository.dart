import '../../data/model/cliente_model.dart';

abstract class TabelaClienteLocalRepository{
  Future<List<ClienteModel>> findAllCliente();

  Future<int> removeCliente(String cnpj);

  Future<void> updateCliente(String cnpj, double credito, String nome);

  Future<void> updateCreditoCliente(ClienteModel clienteModel);
}