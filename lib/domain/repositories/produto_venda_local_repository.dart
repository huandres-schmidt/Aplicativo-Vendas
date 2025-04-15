import 'package:projeto_estagio_vendas/data/model/produto_venda_model.dart';

abstract class ProdutoVendaLocalRepository {
  Future<void> save(ProdutoVendaModel produtoVendaModel);

  Future<List<ProdutoVendaModel>> findAllProdutoVenda();
}