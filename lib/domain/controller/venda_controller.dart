import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/venda_local_repository.dart';

class VendaController {
  final VendaDatabaseLocalRepository _vendaLocalRepository;

  VendaController(this._vendaLocalRepository);

  Future<int> salvarVenda(VendaDatabaseModel listaVendaModel) async =>
      _vendaLocalRepository.save(listaVendaModel);
}
