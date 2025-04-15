import 'package:flutter/cupertino.dart';
import '../../../../data/model/produto_model.dart';

void voltarValorPedido({
  required List<ProdutoModel> pedido,
  required ValueNotifier<double> valorCompraNotifier,
}) {
  double valorNovo = 0;
  double valorAntigo = 0;
  for (var i in pedido) {
    valorAntigo = valorAntigo - i.calculaPrecoTotal();
  }
  valorNovo = valorAntigo * -1;
  valorCompraNotifier.value = valorNovo;
}