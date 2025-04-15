import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';

import '../../core/constants/colors.dart';

class DetalhesProduto extends StatelessWidget {
  final ProdutoModel produto;

  const DetalhesProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 180, left: 40, right: 40, bottom: 180),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: ColorsConstants.laranjaPrincipal,
            ),
            height: 120,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/icone_tela_home.jpg',
                  width: 250, color: Colors.white),
            ),
          ),
          Expanded(
            child: Material(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.numbers),
                    title: Text('Código Produto: ${produto.cdProduto}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.category_outlined),
                    title: Text('Tipo do Produto: ${produto.tipoProduto}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.monitor_weight_outlined),
                    title: Text('Peso do Produto: ${produto.pesoEmbalagem} kg'),
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money_sharp),
                    title: Text(
                        'Valor por kg: R\$ ${produto.vlrPeso!.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.inventory),
                    title: Text('Estoque Disponível: ${produto.estoque}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Fechar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
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