import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import 'package:projeto_estagio_vendas/presentation/screen/lista_venda/widgets/pedido_cliente.dart';

import '../../../../data/model/produto_venda_model.dart';

class CardListaVenda extends StatelessWidget {
  final VendaDatabaseModel venda;
  final List<ProdutoVendaModel> produtoVendaModel;

  CardListaVenda({
    required this.venda, required this.produtoVendaModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showDialog(context: context,
              builder: (BuildContext context) =>
                  PedidoCliente(venda: venda, produtoVendaModel: produtoVendaModel),
          );
        },
        child: Card(
          child: ListTile(
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.green,
            ),
            title: Text('Venda N° ${venda.nroVenda}'),
          ),
        ),
      ),
    );
  }
}
