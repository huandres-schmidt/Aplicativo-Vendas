import 'package:flutter/cupertino.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_state.dart';
import 'card_lista_venda.dart';

class ListaDeVendas extends StatelessWidget{
  final ListaVendaState state;

  ListaDeVendas({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.venda.length,
      itemBuilder: (context, index) {
        final venda = state.venda[index];
        final produtoVenda = state.produtoVendaModel
            .where((produto) =>
        produto.nroPedido == venda.nroVenda)
            .toList();
        return CardListaVenda(
            venda: venda, produtoVendaModel: produtoVenda);
      },
    );
  }
}