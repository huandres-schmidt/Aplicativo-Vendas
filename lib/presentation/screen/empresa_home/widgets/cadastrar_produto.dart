import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';

import '../../../../core/constants/colors.dart';

class CadastrarProduto extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navegarCadastrarProduto(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.fastfood, color: ColorsConstants.laranjaLogo,),
            title: Text('Cadastrar Produto'),
          ),
        ),
      ),
    );
  }
}