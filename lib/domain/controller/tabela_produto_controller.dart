import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/tabela_produto_local_repository.dart';

class TabelaProdutoController {
  final TabelaProdutoLocalRepository _tabelaProdutoLocalRepository;

  TabelaProdutoController(this._tabelaProdutoLocalRepository);

  Future<List<ProdutoModel>> procurarProdutos() async =>
      _tabelaProdutoLocalRepository.findProduto();

  Future<void> deletarProduto(int cdProduto) async =>
      _tabelaProdutoLocalRepository.removeProduto(cdProduto);

  Future<void> editarProduto(
          int cdProduto,
          String tipoProduto,
          String nomeProduto,
          double pesoProduto,
          double valorPesoProduto,
          int estoqueProduto) async =>
      _tabelaProdutoLocalRepository.updateProduto(cdProduto, tipoProduto,
          nomeProduto, pesoProduto, valorPesoProduto, estoqueProduto);

  Future<void> descontarEstoque(ProdutoModel produtoModel) async =>
      _tabelaProdutoLocalRepository.updateEstoque(produtoModel);
}
