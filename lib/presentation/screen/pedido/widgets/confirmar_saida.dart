import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';
import '../../../../data/model/produto_model.dart';

Future<void> confirmarSaida({
  required BuildContext context,
  required List<ProdutoModel> pedido,
  required ValueNotifier<double> valorCompraNotifier,
}) async {
  bool sairRealizarVenda = await showDialog(
    context: context,
    builder: (context) {
      if (pedido.isNotEmpty) {
        return AlertDialog(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.red,
            size: 35,
          ),
          title: Text('Deseja Realmente sair?'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Você perderá os produtos do pedido'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Voltar ao Pedido',
                style: TextStyle(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Volta á tela anterior',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      } else {
        return AlertDialog(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.red,
            size: 35,
          ),
          title: Center(child: Text('Deseja Realmente sair?')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Voltar ao Pedido',
                style: TextStyle(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Volta á tela anterior',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      }
    },
  );
  if (sairRealizarVenda == true) {
    valorCompraNotifier.value = 0.0;
    pedido = [];
    navegarSelecionarCliente(context);
  }
}
