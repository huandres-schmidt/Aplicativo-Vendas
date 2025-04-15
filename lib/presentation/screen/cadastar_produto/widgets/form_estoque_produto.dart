import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormEstoqueProduto extends StatefulWidget {
  final TextEditingController controller;

  FormEstoqueProduto({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormEstoqueProduto();
}

class _FormEstoqueProduto extends State<FormEstoqueProduto> {
  @override
  Widget build(BuildContext context) {
    var estoque = MaskTextInputFormatter(mask: '####');
    return TextFormField(
      inputFormatters: [estoque],
      controller: widget.controller,
      decoration: formularioCadastroProduto(
        'Quantidade Estoque',
        Icon(Icons.inventory, size: 30
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
