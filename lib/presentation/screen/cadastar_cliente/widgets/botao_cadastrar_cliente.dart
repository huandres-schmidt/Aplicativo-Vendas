import 'package:flutter/material.dart';
import '../../../bloc/cadastrar_cliente/cadastrar_cliente_bloc.dart';
import '../../../bloc/cadastrar_cliente/cadastrar_cliente_events.dart';

class BotaoCadastrarCliente extends StatelessWidget {
  final TextEditingController controllerNome;
  final TextEditingController controllerCnpj;
  final TextEditingController controllerCredito;
  final CadastrarClienteBloc bloc;

   BotaoCadastrarCliente({
     required this.controllerNome,
     required this.controllerCnpj,
     required this.controllerCredito,
     required this.bloc,
   });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        bloc.add(ClienteValidarEvent(
            controllerNome.text,
            controllerCnpj.text,
            double.tryParse(controllerCredito.text)
         ),
        );
      },
      icon: Icon(
        Icons.save,
        color: Colors.white,
      ),
      label: Text(
        'Salvar Cliente',
      ),
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(250, 45),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.green),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
