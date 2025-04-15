import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_event.dart';

class BotaoSalvarAlteracoesProduto extends StatelessWidget{

  final TextEditingController controllerNome;
  final TextEditingController controllerPeso;
  final TextEditingController controllerValorPeso;
  final TextEditingController controllerEstoque;
  final ProdutoModel produto;
  final TabelaProdutoBloc bloc;

  BotaoSalvarAlteracoesProduto({
    required this.controllerNome,
    required this.controllerPeso,
    required this.controllerValorPeso,
    required this.controllerEstoque,
    required this.produto,
    required this.bloc
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        bloc.add(TabelaProdutoValidarEvent(
            tipo: produto.tipoProduto,
            nome: controllerNome.text,
            codigo: produto.cdProduto,
            peso: double.tryParse(controllerPeso.text),
            vlrPeso: double.tryParse(controllerValorPeso.text),
            estoque: int.tryParse(controllerEstoque.text),
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