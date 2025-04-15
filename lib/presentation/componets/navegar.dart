import 'package:flutter/material.dart';
import '../../config/routes.dart';

void navegarHome(BuildContext context) {
  Navigator.pushNamed(context, Routes.empresaHome);
}

void navegarTabelaProduto(BuildContext context) {
  Navigator.pushNamed(context, Routes.tabelaProduto);
}

void navegarTabelaCliente(BuildContext context) {
  Navigator.pushNamed(context, Routes.tabelaCliente);
}

void navegarCadastrarCliente(BuildContext context) {
  Navigator.pushNamed(context, Routes.cadastrarCliente);
}

void navegarCadastrarProduto(BuildContext context) {
  Navigator.pushNamed(context, Routes.cadastrarProduto);
}

void navegarRealizarPedido(BuildContext context) {
  Navigator.pushNamed(context, Routes.realizarPedido);
}

void navegarSelecionarCliente(BuildContext context) {
  Navigator.pushNamed(context, Routes.selecionarCliente);
}

void navegarListaVenda(BuildContext context) {
  Navigator.pushNamed(context, Routes.listaVenda);
}
