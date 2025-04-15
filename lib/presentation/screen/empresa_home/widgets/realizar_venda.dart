import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';

class RealizarVenda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navegarSelecionarCliente(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.lightGreen,),
            title: Text('Realizar Venda'),
          ),
        ),
      ),
    );
  }
}