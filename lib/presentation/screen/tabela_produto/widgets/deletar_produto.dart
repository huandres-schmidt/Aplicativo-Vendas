import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_state.dart';
import '../../../bloc/tabela_produto/tabela_produto_event.dart';
import '../../../componets/show_dialog_error.dart';
import '../../../componets/show_dialog_sucess.dart';

class DeletarProduto extends StatelessWidget {
  final ProdutoModel produto;
  final TabelaProdutoBloc bloc;

  DeletarProduto({required this.produto, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<TabelaProdutoBloc, TabelaProdutoState>(
        listener: (context, state) {
          if(state is TabelaProdutoErrorState){
            showDialog(context: context,
                builder: (BuildContext context) => ShowDialogError(mensagem: state.error));
          }
          if(state is TabelaProdutoSucessState){
            showDialog(context: context,
                builder: (BuildContext context) => ShowDialogSucess(mensagem: 'Produto deletado com Sucesso!'));
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
            'Deseja realmente excluir o produto ${produto.nome}?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                bloc.add(TabelaProdutoRemoveEvent(produto: produto));
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
