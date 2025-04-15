import 'package:flutter/material.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormLimiteCredito extends StatefulWidget{

  final TextEditingController controller;
  FormLimiteCredito({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormLimiteCredito();
}

class _FormLimiteCredito extends State<FormLimiteCredito>{

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: formularioCadastroCliente(
        'Limite de Crédito em R\$',
        Icon(Icons.credit_card, size: 30
        ),
      ),
    );
  }
}