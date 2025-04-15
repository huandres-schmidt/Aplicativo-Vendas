import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';

class DetalhesCliente extends StatelessWidget {
  final ClienteModel cliente;

  const DetalhesCliente({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 180, left: 40, right: 40, bottom: 180),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: Colors.blue
            ),
            height: 120,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/icone_tela_home.jpg',
                  width: 250, color: Colors.white
              ),
            ),
          ),
          Expanded(
            child: Material(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Nome do Cliente: ${cliente.nome}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.work_sharp),
                    title: Text('CNPJ do Cliente: ${cliente.cnpj}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Limite de Crédito: R\$ ${cliente.limiteCredito!.toStringAsFixed(2)}'),
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Fechar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}