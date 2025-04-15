import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';

class CadastrarCliente extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navegarCadastrarCliente(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.person_add, color: Colors.blue,),
            title: Text('Cadastrar Cliente'),
          ),
        ),
      ),
    );
  }
}