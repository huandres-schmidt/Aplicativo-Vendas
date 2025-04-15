import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/presentation/componets/detalhes_cliente.dart';

class DetalheClienteAppBar extends StatefulWidget{
  final ClienteModel clienteSelecionado;
  DetalheClienteAppBar({required this.clienteSelecionado});

  @override
  State<DetalheClienteAppBar> createState() => _DetalheClienteAppBarState();
}

class _DetalheClienteAppBarState extends State<DetalheClienteAppBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '${widget.clienteSelecionado.nome!.substring(0, 1)}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return DetalhesCliente(cliente: widget.clienteSelecionado);
          },
        ),
      ),
    );
  }
}