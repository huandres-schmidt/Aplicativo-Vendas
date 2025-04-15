import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/componets/botao_cancelar_alteracoes.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_sucess.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_cliente/widgets/form_nome_cliente.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_state.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_cliente/widgets/botao_salvar_alteracoes_cliente.dart';
import '../../../../data/model/cliente_model.dart';
import '../../cadastar_cliente/widgets/form_limite_credito_cliente.dart';

class EditarCliente extends StatefulWidget {
  final TabelaClienteBloc bloc;
  final TextEditingController controllerNome;
  final TextEditingController controllerCredito;
  final ClienteModel cliente;

  EditarCliente({
    required this.bloc,
    required this.controllerNome,
    required this.controllerCredito,
    required this.cliente
  });

  @override
  State<EditarCliente> createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'EDITAR CLIENTE',
          ),
        ),
        body: BlocListener<TabelaClienteBloc, TabelaClienteState>(
          listener: (context, state){
            if(state is TabelaClienteErrorState){
              showDialog(context: context,
                  builder: (BuildContext context) => ShowDialogError(mensagem: state.error));
            }
            if(state is TabelaClienteSucessState){
              showDialog(context: context,
                  builder: (BuildContext context) => ShowDialogSucess(mensagem: 'Cliente alterado com Sucesso!'));
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 45,
                  ),
                ),
                Text(
                  '${widget.cliente.nome}',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12, right: 8, left: 8, bottom: 12),
                  child: Column(
                    children: [
                      FormNomeCliente(controller: widget.controllerNome),
                      SizedBox(height: 10),
                      FormLimiteCredito(controller: widget.controllerCredito),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BotaoCancelarAlteracoes(),
                    SizedBox(width: 10),
                    BotaoSalvarAlteracoesCliente(
                        controllerNome: widget.controllerNome,
                        controllerCredito: widget.controllerCredito,
                        bloc: widget.bloc,
                        cliente: widget.cliente
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
