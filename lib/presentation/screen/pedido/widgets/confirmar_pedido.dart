import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import '../../../../data/model/produto_model.dart';
import '../../../bloc/pedido/pedido_bloc.dart';
import '../../../bloc/pedido/pedido_events.dart';

Future<void> confirmarPedido({
  required BuildContext context,
  required PedidoBloc bloc,
  required List<ProdutoModel> pedido,
  required double valorCompra,
  required ClienteModel clienteSelecionado,
}) async {
  bool finalizarVenda = await showDialog(
    context: context,
    builder: (BuildContext context) {
      if (pedido.isNotEmpty) {
        return AlertDialog(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.green,
            size: 35,
          ),
          title: Text('Confirmação de Venda'),
          content: Text('Deseja realmente finalizar essa venda?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Voltar ao Pedido',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Finalizar Venda',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      } else {
        return AlertDialog(
          icon: Icon(
            Icons.error,
            color: Colors.red,
            size: 35,
          ),
          title: Text('Erro ao Finalizar Venda'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Você não fez o Pedido'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Fazer Pedido',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      }
    },
  );
  if (finalizarVenda == true) {
    bloc.add(
      PedidoValidarEvent(
        clienteModel: clienteSelecionado,
        valorCompra: valorCompra,
      ),
    );
  }
}
