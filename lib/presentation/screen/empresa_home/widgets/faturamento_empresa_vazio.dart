import 'package:flutter/material.dart';

class FaturamentoEmpresaVazio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/icone_tela_home.jpg',
            width: 225,
            color: Colors.white,
          ),
          Text(
            'Aplicativo Aurora Coop Vendas',
            style:
            TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
          ),
          // Text('${Home.empresa.cnpj}', style: TextStyle(color: Colors.white54)),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Nenhuma Venda Realizada',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}