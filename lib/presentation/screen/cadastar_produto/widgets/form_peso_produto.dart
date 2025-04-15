import 'package:flutter/material.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormPesoProduto extends StatefulWidget {
  final TextEditingController controller;

  FormPesoProduto({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormPesoProduto();
}

class _FormPesoProduto extends State<FormPesoProduto> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: formularioCadastroProduto(
        'Peso do Produto',
        Icon(Icons.balance, size: 30
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
