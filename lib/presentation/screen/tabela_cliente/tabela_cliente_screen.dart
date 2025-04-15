import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_events.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_state.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_cliente/widgets/card_tabela_cliente.dart';
import '../../bloc/tabela_cliente/tabela_cliente_bloc.dart';
import '../../componets/nenhum_cliente_cadastrado.dart';

class TabelaClienteScreen extends StatefulWidget {
  const TabelaClienteScreen({super.key});

  @override
  State<TabelaClienteScreen> createState() => _TabelaClienteScreenState();
}

class _TabelaClienteScreenState extends State<TabelaClienteScreen> {
  final bloc = GetIt.I.get<TabelaClienteBloc>();
  
  @override
  void initState() {
    bloc.add(TabelaClienteLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'TABELA DE CLIENTES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                child: BlocBuilder<TabelaClienteBloc, TabelaClienteState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is TabelaClienteInitialState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is TabelaClienteSucessState) {
                      final clienteLista = state.cliente;
                      if (clienteLista.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NenhumClienteCadastrado(),
                            ],
                          ),
                        );
                      } else {
                        return ListView.builder(
                          key: ValueKey(clienteLista),
                          itemCount: clienteLista.length,
                          itemBuilder: (context, index) {
                            return CardTabelaCliente(
                              bloc: bloc,
                                cliente: clienteLista[index],
                            );
                          },
                        );
                      }
                    }
                    return Center(
                      child: Text(
                        'Ocorreu um Erro Inesperado',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
