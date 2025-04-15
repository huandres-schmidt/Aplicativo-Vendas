import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/calcula_valor_pedido.dart';
import '../../../../data/model/produto_model.dart';

void AdicionarQuantidadeProduto({
    required BuildContext context,
    required ProdutoModel produtos,
    required List<ProdutoModel> pedido,
    required ValueNotifier<double> valorCompraNotifier,
}) {
  if (produtos.qtd! >= produtos.estoque!) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ShowDialogError(
            mensagem: 'Quantidade não disponivel em estoque'));
  }
  else {
    if (pedido.where((e) => e.cdProduto == produtos.cdProduto).isEmpty) {
      produtos.qtd = produtos.qtd! + 1;
      pedido.add(produtos);
    } else {
      int index = pedido
          .indexWhere((element) => element.cdProduto == produtos.cdProduto);
      pedido[index].qtd = pedido[index].qtd! + 1;
    }
    calculaValorPedido(pedido: pedido, valorCompraNotifier: valorCompraNotifier);
  }
}
