import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';

class ListaVenda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navegarListaVenda(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.list, color: Colors.lightGreen),
            title: Text('Lista de Venda'),
          ),
        ),
      ),
    );
  }
}