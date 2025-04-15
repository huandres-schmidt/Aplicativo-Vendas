import 'package:flutter/cupertino.dart';
import '../../../../data/model/produto_model.dart';

void calculaValorPedido({
  required List<ProdutoModel> pedido,
  required ValueNotifier<double> valorCompraNotifier,
}) {
  double valor = 0.0;
  for (var i in pedido) {
    valor += i.calculaPrecoTotal();
  }
  valorCompraNotifier.value = valor;
}