import 'package:projeto_estagio_vendas/data/model/produto_model.dart';

abstract class TabelaProdutoLocalRepository {
  Future<List<ProdutoModel>> findProduto();

  Future<int> removeProduto(int cdProduto);

  Future<void> updateProduto(int cdProduto, String tipoProduto, String nomeProduto,
      double pesoProduto, double valorPesoProduto, int estoqueProduto);

  Future<void> updateEstoque(ProdutoModel produtoModel);
}
