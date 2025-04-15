import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_sucess.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/botao_cadastrar_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_codigo_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_estoque_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_nome_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_peso_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_tipo_produto_teste.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/widgets/form_valor_peso.dart';

import '../../bloc/cadastrar_produto/cadastrar_produto_bloc.dart';
import '../../bloc/cadastrar_produto/cadastrar_produto_state.dart';

class CadastrarProdutoScreen extends StatefulWidget {
  const CadastrarProdutoScreen({super.key});

  @override
  State<CadastrarProdutoScreen> createState() => _CadastrarProdutoScreenState();
}

class _CadastrarProdutoScreenState extends State<CadastrarProdutoScreen> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCodigo = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerValor = TextEditingController();
  TextEditingController controllerEstoque = TextEditingController();
  TipoProduto? tipoProdutos;
  final bloc = GetIt.I.get<CadastrarProdutoBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'CADASTRO DE PRODUTO',
          ),
        ),
        body: BlocListener<CadastrarProdutoBloc, CadastrarProdutoState>(
          listener: (context, state) {
            if (state is ProdutoErrorState) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      ShowDialogError(mensagem: state.erro));
            }
            if (state is ProdutoSucessoState) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogSucess(
                      mensagem: 'Produto Cadastrado com Sucesso!'));

              controllerNome.text = "";
              controllerCodigo.text = "";
              controllerPeso.text = "";
              controllerValor.text = "";
              controllerEstoque.text = "";
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/icone_tela_home.jpg',
                    color: Colors.white,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        FormTipoProduto(bloc: bloc, onTapDrop: (escolha) {
                          setState(() {
                            tipoProdutos = escolha;
                          });
                        }),
                        const SizedBox(height: 15),
                        FormNomeProduto(controller: controllerNome),
                        const SizedBox(height: 15),
                        FormCodigoProduto(controller: controllerCodigo),
                        const SizedBox(height: 15),
                        FormPesoProduto(controller: controllerPeso),
                        const SizedBox(height: 15),
                        FormValorPesoProduto(controller: controllerValor),
                        const SizedBox(height: 15),
                        FormEstoqueProduto(controller: controllerEstoque),
                        const SizedBox(height: 20),
                        BotaoCadastrarProduto(
                          tipoProdutos: tipoProdutos,
                          controllerNome: controllerNome,
                          controllerCodigo: controllerCodigo,
                          controllerPeso: controllerPeso,
                          controllerValor: controllerValor,
                          controllerEstoque: controllerEstoque,
                          bloc: bloc,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
