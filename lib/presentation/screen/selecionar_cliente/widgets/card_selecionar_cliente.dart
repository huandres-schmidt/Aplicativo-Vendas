import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/screen/selecionar_cliente/widgets/remover_cliente_pedido.dart';
import 'package:projeto_estagio_vendas/presentation/componets/detalhes_cliente.dart';
import '../../../../data/model/cliente_model.dart';
import 'adicionar_cliente_pedido.dart';

class CardSelecionarCliente extends StatefulWidget {
  final ClienteModel clienteModel;
  final SelecionarClienteBloc bloc;
  final List<ClienteModel> clienteSelecionado;

  CardSelecionarCliente({
    required this.clienteModel,
    required this.bloc,
    required this.clienteSelecionado,
  });

  @override
  State<CardSelecionarCliente> createState() => _CardSelecionarClienteState();
}

class _CardSelecionarClienteState extends State<CardSelecionarCliente> {
  @override
  Widget build(BuildContext context) {
    if (widget.clienteModel.limiteCredito! > 0) {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: ClipRRect(
              child: TextButton(
                child: Text(
                  '${widget.clienteModel.nome!.substring(0, 1)}',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      DetalhesCliente(cliente: widget.clienteModel),
                ),
              ),
            ),
          ),
          title: Text(
            ' ${widget.clienteModel.nome}',
            style: TextStyle(fontSize: 15),
          ),
          trailing: widget.clienteSelecionado.contains(widget.clienteModel)
              ? SizedBox(
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            removeClientePedido(
                              context: context,
                              cliente: widget.clienteModel,
                              clienteVendaLista: widget.clienteSelecionado,
                            );
                          });
                        },
                        icon: Icon(
                          Icons.person_remove,
                          color: Colors.red,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            adicionarClientePedido(
                              cliente: widget.clienteModel,
                              clienteSelecionado: widget.clienteSelecionado,
                              context: context,
                            );
                          });
                        },
                        icon: Icon(
                          Icons.person_add,
                          color: Colors.green,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
    } else {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: ClipRRect(
              child: TextButton(
                child: Text(
                  '${widget.clienteModel.nome!.substring(0, 1)}',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      DetalhesCliente(cliente: widget.clienteModel),
                ),
              ),
            ),
          ),
          title: Text(
            '${widget.clienteModel.nome}',
            style: TextStyle(
                color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          trailing: SizedBox(
            width: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) =>
                    //       AdicionarCreditoCliente(
                    //     bloc: widget.bloc,
                    //     cliente: widget.clienteModel,
                    //     controller: _controllerLimiteCredito,
                    //   ),
                    // );
                  },
                  icon: Icon(
                    Icons.add_card,
                    size: 27,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
