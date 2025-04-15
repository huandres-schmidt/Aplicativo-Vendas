import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';

import '../../../data/model/produto_venda_model.dart';

abstract class ListaVendaState{
  List<VendaDatabaseModel> venda;
  List<ProdutoVendaModel> produtoVendaModel;

  ListaVendaState({
   required this.venda, required this.produtoVendaModel,
  });

}

class ListaVendaInitialState extends ListaVendaState{
  ListaVendaInitialState() : super(venda: [], produtoVendaModel: []);
}

class ListaVendaSucessState extends ListaVendaState{
  ListaVendaSucessState( List<VendaDatabaseModel> vendas, List<ProdutoVendaModel> produtoVendaModel) : super(venda: vendas, produtoVendaModel: produtoVendaModel);
}

class ListaVendaErrorState extends ListaVendaState{
  final String error;
  ListaVendaErrorState({required this.error}) : super(venda: [], produtoVendaModel: []);
}