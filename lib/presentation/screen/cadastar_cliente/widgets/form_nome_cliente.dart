import 'package:flutter/material.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormNomeCliente extends StatefulWidget{

  final TextEditingController controller;
  FormNomeCliente({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormNomeCliente();
}

class _FormNomeCliente extends State<FormNomeCliente>{

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: formularioCadastroCliente(
        'Nome Cliente',
        Icon(Icons.person, size: 30
        ),
      ),
    );
  }
}