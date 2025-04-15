import 'package:flutter/material.dart';

import '../../../../data/model/venda_model.dart';

class NotaFiscalPedido extends StatelessWidget{
  final VendaModel venda;

  NotaFiscalPedido({
    required this.venda
  });

  @override
  Widget build(BuildContext context) {
    String detalhesVenda = venda.listarVenda();
    return AlertDialog(
      icon: Image.asset(
        'assets/images/icone_tela_home.jpg',
        width: 50,
        height: 125,
        color: Colors.white,
      ),
      title: const Text(
        "Nota Fiscal",
        style: TextStyle(color: Colors.orange),
      ),
      content: SingleChildScrollView(
        child: Text(
          detalhesVenda,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}