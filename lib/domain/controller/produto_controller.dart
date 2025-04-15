import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/produto_local_repository.dart';

class ProdutoController {
  final ProdutoLocalRepository _produtoLocalRepository;

  ProdutoController(this._produtoLocalRepository);

  Future<void> salvarProduto(ProdutoModel produtoModel) async =>
      await _produtoLocalRepository.save(produtoModel);
}
