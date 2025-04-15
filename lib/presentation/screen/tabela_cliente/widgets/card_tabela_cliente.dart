import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_cliente/widgets/deletar_cliente.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_cliente/widgets/editar_cliente.dart';
import '../../../../data/model/cliente_model.dart';
import '../../../componets/detalhes_cliente.dart';

class CardTabelaCliente extends StatelessWidget {

  final ClienteModel cliente;
  final TabelaClienteBloc bloc;

  CardTabelaCliente({
    required this.cliente,
    required this.bloc
  });

  @override
  Widget build(BuildContext context) {

    TextEditingController _controllerNomeCliente =
        TextEditingController(text: '${cliente.nome}');
    TextEditingController _controllerLimiteCliente =
        TextEditingController(text: '${cliente.limiteCredito?.toStringAsFixed(2)}',
    );
    return Card(
      child: Material(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: ClipRRect(
                  child: IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => DetalhesCliente(cliente: cliente),
                    ),
                    icon: Text('${cliente.nome!.substring(0,1)}', style: TextStyle(color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                '${cliente.nome}',
              ),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => EditarCliente(
                              bloc: bloc,
                                controllerNome: _controllerNomeCliente,
                                controllerCredito: _controllerLimiteCliente,
                                cliente: cliente,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                DeletarCliente(cliente: cliente, bloc: bloc,)
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}