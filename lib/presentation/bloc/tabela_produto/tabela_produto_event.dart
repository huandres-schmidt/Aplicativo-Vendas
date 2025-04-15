import 'package:projeto_estagio_vendas/data/model/produto_model.dart';

abstract class TabelaProdutoEvent{}

class TabelaProdutoLoadEvent extends TabelaProdutoEvent{}

class TabelaProdutoEditEvent extends TabelaProdutoEvent{
  ProdutoModel produto;

  TabelaProdutoEditEvent({
   required this.produto
  });
}

class TabelaProdutoValidarEvent extends TabelaProdutoEvent{
  String? tipo;
  String? nome;
  int? codigo;
  double? peso;
  double? vlrPeso;
  int? estoque;

  TabelaProdutoValidarEvent({
    required this.tipo,
    required this.nome,
    required this.codigo,
    required this.peso,
    required this.vlrPeso,
    required this.estoque
  });
}

class TabelaProdutoRemoveEvent extends TabelaProdutoEvent{
  ProdutoModel produto;

  TabelaProdutoRemoveEvent({
    required this.produto
  });
}