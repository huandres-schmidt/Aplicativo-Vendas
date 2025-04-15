import 'package:projeto_estagio_vendas/data/model/produto_venda_model.dart';
import '../repositories/produto_venda_local_repository.dart';

class ProdutoVendaController {
  final ProdutoVendaLocalRepository _produtoVendaLocalRepository;

  ProdutoVendaController(this._produtoVendaLocalRepository);

  Future<void> salvarProdutoVenda(ProdutoVendaModel produtoVendaModel) async =>
      await _produtoVendaLocalRepository.save(produtoVendaModel);

  Future<List<ProdutoVendaModel>> procurarProdutoVenda() async =>
      await _produtoVendaLocalRepository.findAllProdutoVenda();
}
