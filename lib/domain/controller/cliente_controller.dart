import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/cliente_local_repository.dart';

class ClienteController {
  final ClienteLocalRepository _clienteLocalRepository;

  ClienteController(this._clienteLocalRepository);

  Future<void> salvarCliente(ClienteModel cliente) async =>
      await _clienteLocalRepository.save(cliente);

}
