import 'package:projeto_estagio_vendas/domain/repositories/tabela_cliente_local_repository.dart';
import '../../data/model/cliente_model.dart';

class TabelaClienteController {
  final TabelaClienteLocalRepository _tabelaClienteRepository;

  TabelaClienteController(this._tabelaClienteRepository);

  Future<List<ClienteModel>> procurarClientes() async =>
      await _tabelaClienteRepository.findAllCliente();

  Future<void> deletarCliente(String cnpj) async =>
      await _tabelaClienteRepository.removeCliente(cnpj);

  Future<void> editarCliente(String cnpj, double credito, String nome) async =>
      await _tabelaClienteRepository.updateCliente(cnpj, credito, nome);

  Future<void> descontoCreditoCliente(ClienteModel clienteModel) async =>
      await _tabelaClienteRepository.updateCreditoCliente(clienteModel);
}
