import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/volta_valor_pedido.dart';
import '../../../../data/model/produto_model.dart';

void removerQuantidadeProduto({
    required ProdutoModel produtos,
    required BuildContext context,
    required List<ProdutoModel> pedido,
    required ValueNotifier<double> valorCompraNotifier,
  }){
  if (produtos.qtd! < 1) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            ShowDialogError(mensagem: 'A quantidade é inválida'));
  } else {
    int index =
        pedido.indexWhere((element) => element.cdProduto == produtos.cdProduto);
    pedido[index].qtd = pedido[index].qtd! - 1;
    voltarValorPedido(pedido: pedido, valorCompraNotifier: valorCompraNotifier);
  }
}
