import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_event.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_state.dart';
import 'package:projeto_estagio_vendas/presentation/componets/nenhum_produto_cadastrado.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_produto/widgets/card_tabela_produto.dart';

class TabelaProdutoScreen extends StatefulWidget {
  const TabelaProdutoScreen({super.key});

  @override
  State<TabelaProdutoScreen> createState() => _TabelaProdutoScreenState();
}

class _TabelaProdutoScreenState extends State<TabelaProdutoScreen> {
  final bloc = GetIt.I.get<TabelaProdutoBloc>();

  @override
  void initState() {
    bloc.add(TabelaProdutoLoadEvent());
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
            'TABELA PRODUTOS',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                child: BlocBuilder<TabelaProdutoBloc, TabelaProdutoState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is TabelaProdutoInitialState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is TabelaProdutoSucessState) {
                      final produtoLista = state.produtos;
                      if (produtoLista.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NenhumProdutoCadastrado(),
                            ],
                          ),
                        );
                      } else {
                        return ListView.builder(
                          key: ValueKey(produtoLista),
                          itemCount: produtoLista.length,
                          itemBuilder: (context, index) {
                            return CardTabelaProduto(
                              bloc: bloc,
                                produto: produtoLista[index]);
                          },
                        );
                      }
                    } else {
                      return Center(
                        child: Text(
                          'Ocorreu um Erro Inesperado',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
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
