import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_produto/cadastrar_produto_bloc.dart';
import '../../../bloc/cadastrar_produto/cadastrar_produto_events.dart';

class BotaoCadastrarProduto extends StatelessWidget {

  final TextEditingController controllerNome;
  final TextEditingController controllerCodigo;
  final TextEditingController controllerPeso;
  final TextEditingController controllerValor;
  final TextEditingController controllerEstoque;
  final TipoProduto? tipoProdutos;
  final CadastrarProdutoBloc bloc;

  BotaoCadastrarProduto({
      required this.controllerNome,
      required this.controllerCodigo,
      required this.controllerPeso,
      required this.controllerValor,
      required this.controllerEstoque,
      required this.tipoProdutos,
      required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        bloc.add(
          ProdutoValidarEvent(
              escolhaProduto: tipoProdutos!.desc,
              nome: controllerNome.text,
              cdProduto: int.tryParse(controllerCodigo.text),
              pesoProduto: double.tryParse(controllerPeso.text),
              vlrPeso: double.tryParse(controllerValor.text),
              estoque: int.tryParse(controllerEstoque.text),
          ),
        );
      },
      icon: Icon(
        Icons.lunch_dining,
        color: Colors.white,
      ),
      label: Text(
        'Cadastrar Produto'
      ),
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(250, 45),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.green),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
