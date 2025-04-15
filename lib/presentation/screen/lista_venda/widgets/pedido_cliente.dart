import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';

import '../../../../data/model/produto_venda_model.dart';

class PedidoCliente extends StatelessWidget {
  final VendaDatabaseModel venda;
  final List<ProdutoVendaModel> produtoVendaModel;

  const PedidoCliente({
    required this.venda, required this.produtoVendaModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/icone_tela_home.jpg',
                      width: 120, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Número de Venda N° ${venda.nroVenda}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Material(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.blue,
                    ),
                    title: Text('${venda.clienteNome}'),
                    subtitle: Text('${venda.clienteCnpj}'),
                    trailing: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close),),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.numbers,
                      color: Colors.orange,
                    ),
                    title: Text('Nome Produto'),
                    trailing: Text(
                      'QTD',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: produtoVendaModel.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 4,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text(
                            '${produtoVendaModel[index].codigoProdutoVenda}',
                            style:
                                TextStyle(fontSize: 13, color: Colors.orange),
                          ),
                          title:
                              Text('${produtoVendaModel[index].nomeProdutoVenda}'),
                          trailing: Text(
                            '${produtoVendaModel[index].quantidadeProdutoVenda}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                    height: 380,
                    width: 500,
                  ),
                  if (venda.precoTotal! > venda.precoFinal!)
                    ListTile(
                      leading: Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),
                      title: Text('Sub-Total'),
                      trailing: Text(
                        'R\$ ${venda.precoTotal!.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    ),
                  if (venda.descontoVenda! > 0)
                    ListTile(
                      leading: Icon(
                        Icons.currency_exchange,
                        color: Colors.green,
                      ),
                      title: Text('Desconto'),
                      trailing: Text(
                        'R\$ - ${venda.descontoVenda!.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ListTile(
                    leading: Icon(
                      Icons.monetization_on_sharp,
                      color: Colors.green,
                    ),
                    title: Text('Sub-Final'),
                    trailing: Text(
                      'R\$ ${venda.precoFinal!.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
