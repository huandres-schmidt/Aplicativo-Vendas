import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_state.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import '../../../../data/model/cliente_model.dart';
import '../../../bloc/tabela_cliente/tabela_cliente_events.dart';
import '../../../componets/show_dialog_sucess.dart';

class DeletarCliente extends StatelessWidget {
  final TabelaClienteBloc bloc;
  final ClienteModel cliente;

  DeletarCliente({
    required this.bloc,
    required this.cliente,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<TabelaClienteBloc, TabelaClienteState>(
        listener: (context, state) {
          if(state is TabelaClienteErrorState){
            showDialog(context: context,
                builder: (BuildContext context) => ShowDialogError(mensagem: state.error));
          }
          if(state is TabelaClienteSucessState){
            showDialog(context: context,
                builder: (BuildContext context) => ShowDialogSucess(mensagem: 'Cliente deletado com sucesso!'));
          }
        },
        child: AlertDialog(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: 35,
          ),
          title: Text('Confirmação de exclusão'),
          content: Text(
            'Deseja realmente excluir o cliente ${cliente.nome}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                bloc.add(TabelaClienteRemoveEvent(cliente: cliente));
              },
              child: Text(
                'Excluir',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
