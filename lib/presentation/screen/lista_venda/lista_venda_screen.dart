import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_event.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_state.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/screen/lista_venda/widgets/lista_de_vendas.dart';
import 'package:projeto_estagio_vendas/presentation/screen/lista_venda/widgets/nenhuma_venda_cadastrada.dart';

class ListaVendasScreen extends StatefulWidget {
  @override
  State<ListaVendasScreen> createState() => _ListaVendasScreenState();
}

class _ListaVendasScreenState extends State<ListaVendasScreen> {
  final bloc = GetIt.I.get<ListaVendaBloc>();

  @override
  void initState() {
    bloc.add(ListaVendaLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'LISTA DE VENDA',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ListaVendaBloc, ListaVendaState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is ListaVendaInitialState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      );
                    } else if (state is ListaVendaSucessState) {
                      if (state.venda.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NenhumaVendaCadastrada(),
                            ],
                          ),
                        );
                      }
                      return ListaDeVendas(state: state);
                    }
                    else if (state is ListaVendaErrorState) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            ShowDialogError(mensagem: state.error),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
