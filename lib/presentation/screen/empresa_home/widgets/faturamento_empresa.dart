import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';

class FaturamentoEmpresa extends StatelessWidget{

  final EmpresaDatabaseModel empresa;

  FaturamentoEmpresa({
   required this.empresa
  });

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
          Text(
            '${empresa.cnpjEmpresa}',
            style: TextStyle(color: Colors.white54),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'R\$ ${empresa.faturamentoEmpresa!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}