import 'package:flutter/material.dart';

class ValorProdutoUnidade extends StatelessWidget{
  final double valorPeso;
  final double pesoEmbalagem;

  ValorProdutoUnidade({
    required this.valorPeso,
    required this.pesoEmbalagem
  });

  @override
  Widget build(BuildContext context) {
    double valor = 0;
    double valorProduto;
    valor = valorPeso * pesoEmbalagem;
    valorProduto = valor;
    return Text(
      'R\$ ${valorProduto.toStringAsFixed(2)}',
      style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}