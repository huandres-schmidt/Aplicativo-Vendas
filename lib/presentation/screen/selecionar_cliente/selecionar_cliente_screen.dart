import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_event.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_state.dart';
import 'package:projeto_estagio_vendas/presentation/componets/navegar.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import '../../../config/routes.dart';
import '../../../data/model/cliente_model.dart';
import 'widgets/card_selecionar_cliente.dart';
import '../../componets/nenhum_cliente_cadastrado.dart';

class SelecionarClienteScreen extends StatefulWidget {
  @override
  State<SelecionarClienteScreen> createState() => _SelecionarClienteScreenState();
}

class _SelecionarClienteScreenState extends State<SelecionarClienteScreen> {
  List<ClienteModel> clienteSelecionado = [];

  final bloc = GetIt.I.get<SelecionarClienteBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(SelecionarClienteLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: () => navegarHome(context),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'SELECIONAR CLIENTE',
          ),
        ),
        body: BlocListener<SelecionarClienteBloc, SelecionarClienteState>(
          listener: (context, state) {},
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<SelecionarClienteBloc, SelecionarClienteState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is SelecionarClienteInitialState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is SelecionarClienteSucessState) {
                        return Column(
                          children: [
                            if (state.clienteModel.isEmpty)
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NenhumClienteCadastrado(),
                                  ],
                                ),
                              ),
                            if (state.clienteModel.isNotEmpty)
                              SizedBox(
                                height: 700,
                                child: ListView.builder(
                                  itemCount: state.clienteModel.length,
                                  itemBuilder: (context, index) {
                                    return CardSelecionarCliente(
                                      clienteSelecionado: clienteSelecionado,
                                      clienteModel: state.clienteModel[index],
                                      bloc: bloc,
                                    );
                                  },
                                ),
                              ),
                          ],
                        );
                      }
                      if (state is SelecionarClienteErrorState) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ShowDialogError(mensagem: state.erro));
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          ElevatedButton(
            onPressed: () {
              if (clienteSelecionado.isNotEmpty) {
                for (var cliente in clienteSelecionado) {
                  Navigator.pushNamed(context, Routes.realizarPedido,
                      arguments: {'clienteSelecionado': cliente});
                }
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogError(
                      mensagem: 'Selecione um Cliente para Prosseguir!'),
                );
              }
            },
            child: Text('Próximo'),
          ),
        ],
      ),
    );
  }
}
