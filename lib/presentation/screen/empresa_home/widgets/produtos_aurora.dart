import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/core/constants/colors.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';

class ProdutoAurora extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navegarTabelaProduto(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.lunch_dining, color: ColorsConstants.laranjaLogo),
            title: Text('Produtos Aurora',),
          ),
        ),
      ),
    );
  }
}