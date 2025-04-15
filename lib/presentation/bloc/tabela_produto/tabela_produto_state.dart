import '../../../data/model/produto_model.dart';

abstract class TabelaProdutoState{
  List<ProdutoModel> produtos;

  TabelaProdutoState({
   required this.produtos
  });
}

class TabelaProdutoInitialState extends TabelaProdutoState{
  TabelaProdutoInitialState() : super (produtos: []);
}

class TabelaProdutoSucessState extends TabelaProdutoState{
  TabelaProdutoSucessState(List<ProdutoModel> produtos) : super(produtos: produtos);
}

class TabelaProdutoErrorState extends TabelaProdutoState{
  final String error;

  TabelaProdutoErrorState({required this.error}) : super(produtos: []);
}