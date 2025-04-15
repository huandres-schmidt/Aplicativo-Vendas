import 'package:flutter/cupertino.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_cliente/cadastrar_cliente_screen.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_produto/cadastro_produto_screen.dart';
import 'package:projeto_estagio_vendas/presentation/screen/lista_venda/lista_venda_screen.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/pedido_screen.dart';
import 'package:projeto_estagio_vendas/presentation/screen/selecionar_cliente/selecionar_cliente_screen.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_cliente/tabela_cliente_screen.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_produto/tabela_produto_screen.dart';

import '../presentation/screen/empresa_home/empresa_home_screen.dart';

class Routes{
  static const String empresaHome = 'empresa/home';
  static const String cadastrarCliente = 'cadastrar/cliente';
  static const String cadastrarProduto = 'cadastrar/produto';
  static const String listaVenda = '/lista/venda';
  static const String tabelaProduto = 'tabela/produto';
  static const String tabelaCliente = 'tabela/cliente';
  static const String realizarPedido = 'realizar/pedido';
  static const String selecionarCliente = 'selecionar/cliente';

  static final routes = <String, WidgetBuilder>{
    empresaHome: (BuildContext context) => EmpresaHomeScreen(),
    cadastrarCliente: (BuildContext context) => CadastrarClienteScreen(),
    cadastrarProduto: (BuildContext context) => CadastrarProdutoScreen(),
    listaVenda: (BuildContext context) => ListaVendasScreen(),
    tabelaCliente: (BuildContext context) => TabelaClienteScreen(),
    tabelaProduto: (BuildContext context) => TabelaProdutoScreen(),
    realizarPedido: (BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      return PedidoScreen(clienteSelecionado: args['clienteSelecionado']);
    },
    selecionarCliente: (BuildContext context) => SelecionarClienteScreen(),
  };
}