import 'package:flutter/cupertino.dart';
import 'package:projeto_estagio_vendas/presentation/screen/selecionar_cliente/widgets/snack_bar_remover_cliente.dart';
import '../../../../data/model/cliente_model.dart';

void removeClientePedido({
    required BuildContext context,
    required ClienteModel cliente,
    required List<ClienteModel> clienteVendaLista,
 }){
    clienteVendaLista.remove(cliente);
    snackBarRemoveCliente('Você removeu seu Cliente ${cliente.nome} do pedido', context);
}