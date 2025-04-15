import 'package:projeto_estagio_vendas/data/model/produto_model.dart';

abstract class CadastrarProdutoState{
  List<ProdutoModel> produtos;

  CadastrarProdutoState({
    required this.produtos
  });
}

class ProdutoInitialState extends CadastrarProdutoState{
  ProdutoInitialState() : super(produtos: []);
}

class ProdutoSucessoState extends CadastrarProdutoState{
  ProdutoSucessoState() : super(produtos: []);
}

class ProdutoErrorState extends CadastrarProdutoState{
  final String erro;

  ProdutoErrorState({required this.erro}) : super(produtos: []);
}