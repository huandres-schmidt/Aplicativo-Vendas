import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_estagio_vendas/core/constants/colors.dart';
import 'package:projeto_estagio_vendas/presentation/componets/botao_cancelar_alteracoes.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_sucess.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_nome_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_peso_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_valor_peso.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_state.dart';
import '../../../../data/model/produto_model.dart';
import '../../cadastar_produto/widgets/form_estoque_produto.dart';
import 'botao_salvar_alteracoes_produto.dart';
import 'editar_selecionar_tipo_produto.dart';

class EditarProduto extends StatefulWidget {
  final TabelaProdutoBloc bloc;
  final TextEditingController controllerNome;
  final TextEditingController controllerPeso;
  final TextEditingController controllerValorPeso;
  final TextEditingController controllerEstoque;
  final ProdutoModel produto;
  final TipoProduto? tipoProdutoAtual;

  EditarProduto({
    required this.controllerNome,
    required this.controllerPeso,
    required this.controllerValorPeso,
    required this.controllerEstoque,
    required this.produto,
    required this.bloc,
    required this.tipoProdutoAtual,
  });

  @override
  State<EditarProduto> createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProduto> {
  TipoProduto? tipoProdutos;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'EDITAR PRODUTO',
          ),
        ),
        body: BlocListener<TabelaProdutoBloc, TabelaProdutoState>(
          listener: (context, state) {
            if (state is TabelaProdutoErrorState) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      ShowDialogError(mensagem: state.error));
            }
            if (state is TabelaProdutoSucessState) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogSucess(
                      mensagem: 'Produto alterado com Sucesso!'));
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: const Icon(
                    Icons.edit,
                    color: ColorsConstants.laranjaPrincipal,
                    size: 45,
                  ),
                ),
                Text(
                  '${widget.produto.nome}',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 8, left: 8, bottom: 12),
                  child: Column(
                    children: [
                      EditarSelecionarTipoProduto(
                        tipoProdutos: widget.tipoProdutoAtual,
                        onTapDrop: (String? escolha) {
                          setState(
                            () {
                              widget.produto.tipoProduto = escolha;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      FormNomeProduto(
                        controller: widget.controllerNome,
                      ),
                      SizedBox(height: 10),
                      FormPesoProduto(
                        controller: widget.controllerPeso,
                      ),
                      SizedBox(height: 10),
                      FormValorPesoProduto(
                        controller: widget.controllerValorPeso,
                      ),
                      SizedBox(height: 10),
                      FormEstoqueProduto(
                        controller: widget.controllerEstoque,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BotaoCancelarAlteracoes(),
                    SizedBox(width: 10),
                    BotaoSalvarAlteracoesProduto(
                        controllerNome: widget.controllerNome,
                        controllerPeso: widget.controllerPeso,
                        controllerValorPeso: widget.controllerValorPeso,
                        controllerEstoque: widget.controllerEstoque,
                        produto: widget.produto,
                        bloc: widget.bloc,
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
