import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';
import 'package:projeto_estagio_vendas/data/model/venda_model.dart';
import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/empresa_home_screen.dart';
import 'package:projeto_estagio_vendas/presentation/componets/nenhum_produto_cadastrado.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/card_pedido_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/confirmar_saida.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/container_finalizar_pedido.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/detalhe_cliente_app_bar.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/mensagem_compra_realizada.dart';
import '../../bloc/pedido/pedido_bloc.dart';
import '../../bloc/pedido/pedido_events.dart';
import '../../bloc/pedido/pedido_state.dart';

class PedidoScreen extends StatefulWidget {
  final ClienteModel clienteSelecionado;

  const PedidoScreen({super.key, required this.clienteSelecionado});

  @override
  State<StatefulWidget> createState() => PedidoScreenState();
}

class PedidoScreenState extends State<PedidoScreen> {
  final ValueNotifier<double> valorCompraNotifier = ValueNotifier<double>(0.0);
  List<ProdutoModel> pedido = [];
  final bloc = GetIt.I.get<PedidoBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(PedidoLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          centerTitle: true,
          toolbarHeight: 70,
          title: Text(
            'REALIZAR PEDIDO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              confirmarSaida(
                context: context,
                pedido: pedido,
                valorCompraNotifier: valorCompraNotifier,
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            DetalheClienteAppBar(clienteSelecionado: widget.clienteSelecionado)
          ],
        ),
        body: BlocListener<PedidoBloc, PedidoState>(
          listener: (context, state) {
            if (state is PedidoVerifSucess) {
              VendaModel minhaVenda = VendaModel(cliente: widget.clienteSelecionado, produtos: pedido);
              minhaVenda.venda();

              // BlocVenda que realiza a venda
              bloc.add(
                PedidoAddEvent(
                  produtos: pedido,
                  clienteModel: widget.clienteSelecionado,
                  vendaDataBase: VendaDatabaseModel(
                    clienteCnpj: minhaVenda.cliente!.cnpj,
                    clienteNome: minhaVenda.cliente!.nome,
                    nroVenda: minhaVenda.nroVenda,
                    descontoVenda: minhaVenda.desconto,
                    precoTotal: minhaVenda.precoTotal,
                    precoFinal: minhaVenda.precoFinal,
                  ),
                ),
              );
              // essa funcao só recebe os valores e transforma para o Home.empresa.faturamento
              EmpresaHomeScreen.empresa.calculaFaturamento(minhaVenda.precoFinal!);

              bloc.add(
                PedidoAddFaturamentoEvent(
                  empresaDataBase: EmpresaDatabaseModel(
                      cnpjEmpresa: EmpresaHomeScreen.empresa.cnpj,
                      nomeEmpresa: EmpresaHomeScreen.empresa.nome,
                      faturamentoEmpresa:
                          EmpresaHomeScreen.empresa.faturamento),
                ),
              );

              // Desconta no credito do cliente
              bloc.add(
                PedidoDescontoCreditoClientEvent(
                    clienteModel: widget.clienteSelecionado),
              );

              // Desconta Estoque do Produto
              for (var produtos in pedido) {
                produtos.descontaEstoque();
                bloc.add(PedidoDescontoEstoqueProdutoEvent(produto: produtos));
              }

              // Exibe a tela de compra concluida
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MensagemCompraRealizada(venda: minhaVenda);
                  });

              Timer(
                Duration(seconds: 1),
                () {
                  if (mounted) {
                    setState(
                      () {
                        valorCompraNotifier.value = 0.0;
                        pedido = [];
                      },
                    );
                  }
                },
              );
            }
            if (state is PedidoVerificError) {
              bloc.add(PedidoLoadEvent());
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    ShowDialogError(mensagem: state.erro),
              );
              setState(
                () {
                  valorCompraNotifier.value = 0.0;
                  pedido = [];
                },
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<PedidoBloc, PedidoState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is PedidoInitial) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        );
                      }
                      if (state is PedidoSucess) {
                        return Column(
                          children: [
                            if (state.produtoModel!.isEmpty)
                              NenhumProdutoCadastrado(),
                            if (state.produtoModel!.isNotEmpty)
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: state.produtoModel!.length,
                                  itemBuilder: (context, index) {
                                    return CardPedidoProduto(
                                      pedido: pedido,
                                      valorCompraNotifier: valorCompraNotifier,
                                      produto: state.produtoModel![index],
                                      bloc: bloc,
                                    );
                                  },
                                ),
                              ),
                          ],
                        );
                      }
                      if (state is PedidoError) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ShowDialogError(mensagem: state.erro));
                      }
                      return Center(
                        child: Text('Erro Desconhecido, Reinicie o Aplicativo')
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ContainerFinalizarPedido(
          clienteSelecionado: widget.clienteSelecionado,
          valorCompraNotifier: valorCompraNotifier,
          pedido: pedido,
          bloc: bloc,
        ),
      ),
    );
  }
}
