import 'package:projeto_estagio_vendas/data/model/produto_model.dart';

abstract class ProdutoLocalRepository{
  Future<void> save(ProdutoModel produtoModel);
}