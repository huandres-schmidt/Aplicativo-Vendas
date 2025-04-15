import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/core/constants/colors.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import '../../../bloc/pedido/pedido_bloc.dart';
import 'confirmar_pedido.dart';

class ContainerFinalizarPedido extends StatelessWidget {
  final PedidoBloc bloc;
  final List<ProdutoModel> pedido;
  final ValueNotifier<double> valorCompraNotifier;
  final ClienteModel clienteSelecionado;

  ContainerFinalizarPedido({
    required this.bloc,
    required this.pedido,
    required this.valorCompraNotifier,
    required this.clienteSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valorCompraNotifier,
      builder: (context, valorCompra, _) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.green, width: 6.0),
              left: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide.none,
            ),
            color: ColorsConstants.fundoTelaDark,
          ),
          height: 58,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Sub-Total:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                          ),
                    ),
                    Text(
                      ' R\$ ${valorCompra.toStringAsFixed(2)} ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    confirmarPedido(
                      clienteSelecionado: clienteSelecionado,
                      valorCompra: valorCompra,
                      context: context,
                      bloc: bloc,
                      pedido: pedido,
                    );
                  },
                  icon: Icon(Icons.check, color: Colors.white
                  ),
                  label: Text(
                    'Finalizar',
                    style: TextStyle(color: Colors.white
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
