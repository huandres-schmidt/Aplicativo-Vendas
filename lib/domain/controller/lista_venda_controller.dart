import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/lista_venda_local_repository.dart';

class ListaVendaController {
  final ListaVendaLocalRepository _vendaLocalRepository;

  ListaVendaController(this._vendaLocalRepository);

  Future<List<VendaDatabaseModel>> procurarVenda() async =>
      _vendaLocalRepository.findAllVenda();
}
