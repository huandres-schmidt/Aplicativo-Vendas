import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_events.dart';

class BotaoSalvarAlteracoesCliente extends StatelessWidget{

  final TextEditingController controllerNome;
  final TextEditingController controllerCredito;
  final TabelaClienteBloc bloc;
  final ClienteModel cliente;

  BotaoSalvarAlteracoesCliente({
    required this.controllerNome,
    required this.controllerCredito,
    required this.bloc,
    required this.cliente,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        bloc.add(
          TabelaClienteValidarEditEvent(
              nome: controllerNome.text,
              limiteCredito: double.tryParse(controllerCredito.text),
              cnpj: cliente.cnpj
          ),
        );
      },
      label: Text(
        'Salvar Alterações',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      icon: Icon(
        Icons.save,
        color: Colors.white,
        size: 20,
      ),
      style: ButtonStyle(
        backgroundColor:
        MaterialStatePropertyAll(Colors.green),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}