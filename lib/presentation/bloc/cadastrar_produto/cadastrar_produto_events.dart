import 'package:projeto_estagio_vendas/data/model/produto_model.dart';

abstract class CadastrarProdutoEvent {}

class ProdutoValidarEvent extends CadastrarProdutoEvent {
  String? escolhaProduto;
  String? nome;
  int? cdProduto;
  double? pesoProduto;
  double? vlrPeso;
  int? estoque;

  ProdutoValidarEvent({
    required this.escolhaProduto,
    required this.nome,
    required this.cdProduto,
    required this.pesoProduto,
    required this.vlrPeso,
    required this.estoque
  });
}

class ProdutoAddEvent extends CadastrarProdutoEvent{
  ProdutoModel produto;

  ProdutoAddEvent({
    required this.produto,
  });
}
