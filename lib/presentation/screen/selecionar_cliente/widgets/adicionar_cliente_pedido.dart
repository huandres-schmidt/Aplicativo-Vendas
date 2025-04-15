import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/screen/selecionar_cliente/widgets/snack_bar_add_cliente.dart';
import '../../../../data/model/cliente_model.dart';

void adicionarClientePedido({
    required BuildContext context,
    required ClienteModel cliente,
    required List<ClienteModel> clienteSelecionado,
}){
  if (clienteSelecionado.isNotEmpty) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ShowDialogError(
            mensagem: 'Não é possivel adicionar dois clientes'));
  } else {
    snackBarAddCliente(
        'Seu cliente ${cliente.nome} foi adicionado ao pedido', context);
    clienteSelecionado.add(cliente);
  }
}
